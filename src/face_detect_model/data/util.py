import cv2
import os

def load_cascade(cascade_path):
    """Haar Cascadeを読み込む"""
    return cv2.CascadeClassifier(cv2.data.haarcascades + cascade_path)

def detect_faces(image_path, face_cascade):
    """画像から顔を検出する"""
    image = cv2.imread(image_path)
    if image is None:
        print(f"画像ファイルが見つからないか読み込めません: {image_path}")
        return None, None
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    return image, faces

def save_faces(image, faces, save_dir, image_size):
    """検出された顔を固定サイズで保存する"""
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    for i, (x, y, w, h) in enumerate(faces):
        face_roi = image[y:y+h, x:x+w]
        # 画像を固定サイズにリサイズ
        resized_face = cv2.resize(face_roi, image_size, interpolation=cv2.INTER_AREA)
        save_path = os.path.join(save_dir, f'face_{i}.jpg')
        if not cv2.imwrite(save_path, resized_face):
            print(f"画像の保存に失敗しました: {save_path}")
        else:
            print(f"画像を保存しました: {save_path}")

def main():
     # パスの指定
    face_cascade_path = 'haarcascade_frontalface_default.xml'
    image_path = 'src/face_detect_model/data/test2.jpg' 
    save_dir = './detected_faces'
    image_size = (100, 100) # 保存する画像サイズ

    # Haar Cascadeの読み込み
    face_cascade = load_cascade(face_cascade_path)

    # 画像から顔を検出
    image, faces = detect_faces(image_path, face_cascade)
    if image is not None and faces is not None:
        # 検出された顔を固定サイズで保存
        save_faces(image, faces, save_dir, image_size)

if __name__ == "__main__":
    main()
