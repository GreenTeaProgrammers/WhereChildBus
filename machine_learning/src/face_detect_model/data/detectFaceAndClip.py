import cv2
import os
import yaml


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
    resized_face = cv2.resize(face_roi, image_size, interpolation=cv2.INTER_AREA)
    return resized_face


def save_face(face, save_dir, save_file_name):
    """クリップされた顔画像を保存する"""
    if not os.path.exists(os.path.dirname(save_dir)):
        os.makedirs(os.path.dirname(save_dir))
    save_path = os.path.join(save_dir, save_file_name)
    try:
        cv2.imwrite(save_path, face)
    except Exception as e:
        raise e


def main():
    # パスの指定
    with open("src/face_detect_model/config.yaml", "r") as f:
        config = yaml.safe_load(f)

    face_cascade_path = config["face_detect"]["cascade_path"]
    image_dir_path = "src/face_detect_model/data/img"
    save_dir = "src/face_detect_model/data/detect_img"
    image_size = (
        config["face_detect"]["clip_size"]["height"],
        config["face_detect"]["clip_size"]["width"],
    )

    # 保存先ディレクトリの作成，存在した場合は中身を削除
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    else:
        for file in os.listdir(save_dir):
            file_path = os.path.join(save_dir, file)
            if os.path.isfile(file_path):
                os.remove(file_path)

    # 画像の読み込み
    # TODO: 良い感じのlog
    for target_people_name in os.listdir(image_dir_path):
        detect_face_num = 0
        for image_name in os.listdir(os.path.join(image_dir_path, target_people_name)):
            image = cv2.imread(
                image_path := os.path.join(
                    image_dir_path, target_people_name, image_name
                )
            )
            if image is None:
                raise ValueError(
                    f"画像ファイルが見つからないか読み込めません: {image_path}"
                )
            # Haar Cascadeの読み込み
            face_cascade = load_cascade(face_cascade_path)

            # 画像から顔を検出
            faces = detect_face(
                image,
                face_cascade,
                scaleFactor=config["face_detect"]["scale_factor"],
                minNeighbors=config["face_detect"]["min_neighbors"],
                minSize=(
                    config["face_detect"]["min_size"]["height"],
                    config["face_detect"]["min_size"]["width"],
                ),
            )

            # 検出された各顔に対して処理
            for face in faces:
                clipped_face = clip_and_resize_face(face, image, image_size)
                save_file_name = f"{target_people_name}-{detect_face_num}.png"
                save_face(clipped_face, save_dir, save_file_name)
                detect_face_num += 1


if __name__ == "__main__":
    main()
