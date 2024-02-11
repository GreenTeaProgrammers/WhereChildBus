import cv2
import numpy as np
import os

def define_luts():
    # High Contrast LUT
    LUT_HC = np.array([0 if i < 128 else 255 for i in range(256)], dtype=np.uint8)
    # Low Contrast LUT
    LUT_LC = np.array([i // 2 + 128 // 2 for i in range(256)], dtype=np.uint8)
    # Gamma Correction LUTs
    LUT_G1 = np.array([((i / 255.0) ** 0.5) * 255 for i in np.arange(0, 256)]).astype("uint8")
    LUT_G2 = np.array([((i / 255.0) ** 2.0) * 255 for i in np.arange(0, 256)]).astype("uint8")
    return LUT_HC, LUT_LC, LUT_G1, LUT_G2

# ヒストグラム均一化
def equalizeHistRGB(image):
    channels = cv2.split(image)
    eq_channels = []

    for ch in channels:
        eq_channels.append(cv2.equalizeHist(ch))

    hist_image = cv2.merge(eq_channels)
    return hist_image

# ガウシアンノイズ
def addGaussianNoise(image):
    row, col, ch = image.shape
    mean = 0
    sigma = 15  # 標準偏差
    gauss = np.random.normal(mean, sigma, (row, col, ch))
    gauss = gauss.reshape(row, col, ch).astype('float32')
    noisy_image = np.clip(image.astype('float32') + gauss, 0, 255)
    return noisy_image.astype('uint8')

def addSaltNoise(image, amount=0.004, s_vs_p=0.5):
    row, col, ch = image.shape
    num_salt = np.ceil(amount * image.size * s_vs_p).astype(int)
    # ランダムな座標に対してSaltノイズを適用
    for _ in range(num_salt):
        x = np.random.randint(0, row)
        y = np.random.randint(0, col)
        image[x, y] = 255
    return image

def addPepperNoise(image, amount=0.004, s_vs_p=0.5):
    row, col, ch = image.shape
    num_pepper = np.ceil(amount * image.size * (1. - s_vs_p)).astype(int)
    # ランダムな座標に対してPepperノイズを適用
    for _ in range(num_pepper):
        x = np.random.randint(0, row)
        y = np.random.randint(0, col)
        image[x, y] = 0
    return image

def main():
    image_path = 'src/face_detect_model/data/Nanakusa.jpeg'
    image = cv2.imread(image_path)
    if image is None:
        print(f"画像ファイルが読み込めません: {image_path}")
        return
    
    # LUTの定義
    LUT_HC, LUT_LC, LUT_G1, LUT_G2 = define_luts()
    
    # 画像の前処理
    trans_img = [image]
    trans_img += [cv2.LUT(image, LUT) for LUT in [LUT_HC, LUT_LC, LUT_G1, LUT_G2]]
    trans_img.append(cv2.blur(image, (5, 5)))
    trans_img.append(equalizeHistRGB(image))
    # ガウシアンノイズを追加
    trans_img.append(addGaussianNoise(image))
    # Saltノイズを追加
    trans_img.append(addSaltNoise(image))
    # Pepperノイズを追加
    trans_img.append(addPepperNoise(image))
    
    # 画像の反転処理
    flip_img = [cv2.flip(img, 1) for img in trans_img]
    trans_img.extend(flip_img)
    
    # 処理後の画像を保存するディレクトリの定義と作成
    save_dir = "trans_images"
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    
    # 画像の保存
    base_name = os.path.splitext(os.path.basename(image_path))[0]
    for i, img in enumerate(trans_img):
        save_path = os.path.join(save_dir, f"{base_name}_{i}.jpg")
        cv2.imwrite(save_path, img)

if __name__ == '__main__':
    main()
