.PHONY: info plan run test deploy logs

info:
	vulcan info

plan:
	vulcan plan

run:
	vulcan run

test:
	vulcan test

deploy:
	dataos-ctl resource apply -f domain-resource.yaml

logs:
	dataos-ctl resource -t vulcan -n powerbi-testing-dp-v2 logs
