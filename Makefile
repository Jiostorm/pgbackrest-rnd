.PHONY: minio-sock ssh-sock ssh-sock-ctl build up down ctl-up ctl-down

socks="2222\n2223"
socks-ctl="2224\n2225"

minio-sock:
	@ssh -fN -L 9000:localhost:9000 $(MINIO_HOST)
	@ssh -fN -L 9001:localhost:9001 $(MINIO_HOST)
ssh-sock:
	@echo $(socks) | xargs -I{} ssh -fN -R 9000:localhost:9000 root@localhost -p {}
ssh-sock-ctl:
	@echo $(socks-ctl) | xargs -I{} ssh -fN -R 9000:localhost:9000 root@localhost -p {}

build:
	@docker build -t pg-pitr:latest .

up:
	@docker compose up primary replica -d
xup: up ssh-sock
	@echo
down:
	@docker compose down primary replica

up-ctl:
	@docker compose up primary-ctl replica-ctl -d
xup-ctl: up-ctl ssh-sock-ctl
	@echo
down-ctl:
	@docker compose down primary-ctl replica-ctl
