all: init

init:
	pip install -r requirements.txt

align-lfw:
	for N in {1..4}; do \
		python src/align/align_dataset_mtcnn.py \
		data/my/lfw \
		data/my/lfw_mtcnnpy_160 \
		--image_size 160 \
		--margin 32 \
		--random_order \
		--gpu_memory_fraction 0.25 \
	& done

validate-lfw:
	python src/validate_on_lfw.py \
		data/my/lfw_mtcnnpy_160 \
		data/my/models/20180408-102900 \
		--distance_metric 1 \
		--use_flipped_images \
		--subtract_mean \
		--use_fixed_image_standardization
