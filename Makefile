#!make

# Copyright (c) 2021 Romullo @hiukky.

# This file is part of Arch
# (see https://github.com/hiukky/arch).

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

WORKDIR=/tmp/archiso-tmp
SRC=/arch
OUT=$(SRC)/out
VERSION=$(LOGPATH)$(shell date +%Y.%m.%d)


.PHONY: install

install:
	docker exec -it arch $(SRC)/bootstrap.sh

.PHONY: build

build:
	docker exec -it arch mkarchiso -v -w $(WORKDIR) -o $(OUT) $(SRC)

.PHONY: clean

clean:
	docker exec -it arch rm -rf $(WORKDIR)

.PHONY: run

run:
	docker exec -it arch run_archiso -i $(OUT)/archlinux-$(VERSION)-x86_64.iso
