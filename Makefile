build: Dockerfile
	docker build -t ansible:latest .

run:
	docker run -it --rm ansible:latest bash
