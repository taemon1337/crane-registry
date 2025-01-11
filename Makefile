PWD := $(shell pwd)
IMAGE ?= crane-registry
NAME := crane_registry
PORT ?= 5000
UID := $(shell id -u)
GID := $(shell id -g)

build:
	docker build -t $(IMAGE) .

run:
	docker run -it --rm --user $(UID):$(GID) $(IMAGE)

start:
	docker run -it --rm -d --user $(UID):$(GID) --name $(NAME) -p $(PORT):443 $(IMAGE)

stop:
	docker stop $(NAME)

exec:
	docker exec -it $(NAME) sh
