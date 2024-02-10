import cv2
import os

def load_cascade(cascade_path):
    """Haar Cascadeを読み込む"""
    return cv2.CascadeClassifier(cv2.data.haarcascades + cascade_path)

def detect_face(image, face_cascade):
    """画像から顔を検出する"""
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    return faces

def clip_and_resize_face(image, x, y, w, h, image_size):
    """検出された顔をクリップし、指定サイズにリサイズする"""
    face_roi = image[y:y+h, x:x+w]
    resized_face = cv2.resize(face_roi, image_size, interpolation=cv2.INTER_AREA)
    return resized_face

def save_face(face, save_dir, index):
    """クリップされた顔画像を保存する"""
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    save_path = os.path.join(save_dir, f'face_{index}.jpg')
    try:
        cv2.imwrite(save_path, face)
        print(f"画像を保存しました: {save_path}")
    except Exception as e:
        print(f"画像の保存に失敗しました: {save_path}. エラー: {e}")

def main():
    # パスの指定
    face_cascade_path = 'haarcascade_frontalface_default.xml'
    image_path = 'src/face_detect_model/data/Nanakusa.jpeg'
    save_dir = './src/face_detect_model/data/img'
    image_size = (100, 100)

    # 画像の読み込み
    image = cv2.imread(image_path)
    if image is None:
        print(f"画像ファイルが見つからないか読み込めません: {image_path}")
        return
    
    # Haar Cascadeの読み込み
    face_cascade = load_cascade(face_cascade_path)
    
    # 画像から顔を検出
    faces = detect_face(image, face_cascade)
    
    # 検出された各顔に対して処理
    for i, (x, y, w, h) in enumerate(faces):
        clipped_face = clip_and_resize_face(image, x, y, w, h, image_size)
        save_face(clipped_face, save_dir, i)

if __name__ == "__main__":
    main()
