run-from-arg:
	. $$HOME/.cargo/env && cargo run $(ARG) > /tmp/tmp.s
	cc /tmp/tmp.s -o /tmp/bin
	/tmp/bin

docker:
	docker run --rm -v .:/minicc -w /minicc minicc make ARG="$(ARG)"

docker-it:
	docker run --rm -it -v .:/minicc -w /minicc minicc

docker-build:
	docker build -t minicc .

.PHONY: run docker docker-build docker-it