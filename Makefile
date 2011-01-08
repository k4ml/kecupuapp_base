# Copyright (c) 2011(s), Mohd. Kamal Bin Mustafa <kamal.mustafa@gmail.com>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PACKAGE_VERSION=1.0.0
PACKAGE_NAME='kecupuapp_base'
SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`

install: clean
	python setup.py install

install_dist: clean
	python setup.py sdist
	cd dist && tar xzf $(PACKAGE_NAME)-$(PACKAGE_VERSION).tar.gz \
		&& cd $(PACKAGE_NAME)-$(PACKAGE_VERSION) \
		&& python setup.py install

develop: uninstall clean
	ln -s `pwd`/$(PACKAGE_NAME) $(SITE_PACKAGES)/$($PACKAGE_NAME)

clean:
	rm -rf build
	rm -rf dist
	rm -rf $(PACKAGE_NAME).egg-info
	rm -rf MANIFEST
	find -name "*.pyc" -delete

uninstall:
	cd $(SITE_PACKAGES) && rm -rf $(PACKAGE_NAME)*
