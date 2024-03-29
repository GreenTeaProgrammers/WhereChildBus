import cv2


def load_cascade(cascade_path):
    """Haar Cascadeを読み込む"""
    return cv2.CascadeClassifier(cv2.data.haarcascades + cascade_path)


def detect_face(
    image, face_cascade, scaleFactor=1.1, minNeighbors=15, minSize=(50, 50)
):
    """画像から顔を検出する"""
    faces = face_cascade.detectMultiScale(
        image, scaleFactor=scaleFactor, minNeighbors=minNeighbors, minSize=minSize
    )
    return faces


def clip_and_resize_face(face, image, image_size):
    """検出された顔をクリップし、指定サイズにリサイズする"""
    (x, y, w, h) = face
    face_roi = image[y : y + h, x : x + w]
    resized_face = cv2.resize(face_roi, image_size, interpolation=cv2.INTER_CUBIC)
    return resized_face
