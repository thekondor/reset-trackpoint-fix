### https://git.thekondor.net/?p=reset-trackpoint-fix.git (mirror: github.com/thekondor/reset-trackpoint-fix)

.PHONY: help
help: ## Show (this) help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Install files
	@test -f ${DESTDIR}/etc/reset-trackpoint-fix.conf || install -Dm644 reset-trackpoint-fix.conf ${DESTDIR}/etc/reset-trackpoint-fix.conf
	@install -Dm755 reset-trackpoint-fix.sh ${DESTDIR}/usr/bin/reset-trackpoint-fix.sh
	@install -Dm644 reset-trackpoint-fix.service ${DESTDIR}/etc/systemd/system/reset-trackpoint-fix.service

.PHONY: uninstall
uninstall: disable ## Remove installed files
	@rm ${DESTDIR}/usr/bin/reset-trackpoint-fix.sh
	@rm ${DESTDIR}/etc/systemd/system/reset-trackpoint-fix.service

.PHONY: enable
enable: ## Enable a service file to trigger resets
	systemctl enable ${DESTDIR}/etc/systemd/system/reset-trackpoint-fix.service

.PHONY: disable
disable: ## Disable a service file
	systemctl disable reset-trackpoint-fix.service
