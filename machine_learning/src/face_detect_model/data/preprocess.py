import cv2
import numpy as np
import sys
import os


# ヒストグラム均一化
def equalizeHistRGB(image):
    RGB = cv2.split(image)
    Blue   = RGB[0]
    Green = RGB[1]
    Red    = RGB[2]
    for i in range(3):
        cv2.equalizeHist(RGB[i])

    hist_image = cv2.merge([RGB[0],RGB[1], RGB[2]])
    return hist_image

# ガウシアンノイズ
def addGaussianNoise(image):
    row,col,ch= image.shape
    mean = 0
    var = 0.1
    sigma = 15
    gauss = np.random.normal(mean,sigma,(row,col,ch))
    gauss = gauss.reshape(row,col,ch)
    noise_image = image + gauss
    return noise_image

# salt&pepperノイズ
def addSaltPepperNoise(image):
    row, col, ch = image.shape
    s_vs_p = 0.5
    amount = 0.004
    out = np.copy(image)

    # Salt mode
    num_salt = np.ceil(amount * image.size * s_vs_p)
    coords = [np.random.randint(0, i - 1, int(num_salt)) for i in (row, col)]
    out[coords[0], coords[1], :] = (255, 255, 255)

    # Pepper mode
    num_pepper = np.ceil(amount * image.size * (1. - s_vs_p))
    coords = [np.random.randint(0, i - 1, int(num_pepper)) for i in (row, col)]
    out[coords[0], coords[1], :] = (0, 0, 0)

    return out

def main():
    
    image_path = '/mnt/c/Users/takuy/Downloads/WhereChildBus/machine_learning/src/face_detect_model/data/Nanakusa.jpeg'
    img_src = cv2.imread(image_path)
    if img_src is None:
        print(f"画像ファイルが読み込めません: {image_path}")
        return
    
    # Define kernel size for blurring
    average_square = (5, 5)
    
    # Define LUT for High Contrast
    LUT_HC = np.array([0 if i < 128 else 255 for i in range(256)], dtype=np.uint8)

    # Define LUT for Low Contrast
    LUT_LC = np.array([i//2 + 128//2 for i in range(256)], dtype=np.uint8)

    # Define LUT for Gamma 1 (increase brightness)
    gamma1 = 0.5  # More than 1 will darken; less than 1 will brighten
    LUT_G1 = np.array([((i / 255.0) ** gamma1) * 255 for i in np.arange(0, 256)]).astype("uint8")

    # Define LUT for Gamma 2 (decrease brightness)
    gamma2 = 2.0
    LUT_G2 = np.array([((i / 255.0) ** gamma2) * 255 for i in np.arange(0, 256)]).astype("uint8")

    # 画像の前処理と変換処理を行う
    trans_img = [img_src]
    # Assuming LUT_HC, LUT_LC, LUT_G1, and LUT_G2 are defined earlier in your script
    trans_img += [cv2.LUT(img_src, LUT) for LUT in [LUT_HC, LUT_LC, LUT_G1, LUT_G2]]
    trans_img.append(cv2.blur(img_src, average_square))
    trans_img.append(equalizeHistRGB(img_src))
    trans_img.append(addGaussianNoise(img_src))
    trans_img.append(addSaltPepperNoise(img_src))

    # 画像の反転処理
    flip_img = [cv2.flip(img, 1) for img in trans_img]
    trans_img.extend(flip_img)

    # 処理後の画像を保存するディレクトリの確認と作成
    save_dir = "trans_images"
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    
    # 処理後の画像を保存
    base_name = os.path.splitext(os.path.basename(image_path))[0]
    for i, img in enumerate(trans_img):
        save_path = f"{save_dir}/{base_name}_{i}.jpg"
        cv2.imwrite(save_path, img)

if __name__ == '__main__':
    main()