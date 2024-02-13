import cv2
import os


def load_cascade(cascade_path):
    """Haar Cascadeを読み込む"""
    return cv2.CascadeClassifier(cv2.data.haarcascades + cascade_path)


def detect_face(
    image, face_cascade, scaleFactor=1.1, minNeighbors=15, minSize=(50, 50)
):
    """画像から顔を検出する"""
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(
        gray, scaleFactor=scaleFactor, minNeighbors=minNeighbors, minSize=minSize
    )
    return faces


def clip_and_resize_face(face, image, image_size):
    """検出された顔をクリップし、指定サイズにリサイズする"""
    (x, y, w, h) = face
    face_roi = image[y : y + h, x : x + w]
    resized_face = cv2.resize(face_roi, image_size, interpolation=cv2.INTER_CUBIC)
    return resized_face


def save_face(face, save_dir, save_file_name):
    """クリップされた顔画像を保存する"""
    os.makedirs(save_dir, exist_ok=True)

    save_path = os.path.join(save_dir, save_file_name)
    cv2.imwrite(save_path, face)
