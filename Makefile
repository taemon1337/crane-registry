PWD := $(shell pwd)
IMAGE ?= crane-registry
NAME := crane_registry
DATA := ./data
PORT ?= 5000

build:
	docker build -t $(IMAGE) .

run:
	docker run -it --rm -v $(DATA):/var/lib/registry $(IMAGE)

start:
	docker run -it --rm -d --name $(NAME) -p $(PORT):443 -v $(DATA):/var/lib/registry $(IMAGE)

stop:
	docker stop $(NAME)

exec:
	docker exec -it $(NAME) sh

test:
	docker exec $(NAME) crane pull hello-world hello-world.img
	docker exec $(NAME) crane push hello-world.img http://127.0.0.1:5000
