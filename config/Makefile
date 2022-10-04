.PHONY: django dramatiq, dramatiqr, test migrate, makemigrations, static, db, loadprod, loadtest, flush, superuser, venv, venvd

test:
	python -m unittest discover -s tests -t .

django:
	cd frontend/; \
	python manage.py runserver

dramatiqr:
	cd frontend/; \
	sudo service redis-server start; \
	python manage.py rundramatiq

dramatiq:
	cd frontend/; \
	python manage.py rundramatiq

migrate:
	cd frontend/; \
	python manage.py migrate

makemigrations:
	cd frontend/; \
	python manage.py makemigrations

static:
	cd frontend/; \
	python manage.py collectstatic

loadprod:
	cd frontend/; \
	python manage.py migrate; \
	python manage.py flush --no-input; \
	python manage.py loaddata db_backup_prod.json

loadtest:
	cd frontend/; \
	python manage.py migrate; \
	python manage.py flush --no-input; \
	python manage.py loaddata db_backup_test.json

flush:
	cd frontend/; \
	python manage.py flush

superuser:
	cd  frontend/; \
	python manage.py createsuperuser

venv:
	python3.8 -m venv .venv
	echo "set -a && . ./config.env && set +a" >> .venv/bin/activate
	. .venv/bin/activate; \
	pip install -U pip setuptools wheel; \
	pip install --no-deps django-plotly-dash==2.0.0; \
	poetry install

venvd:
	rm -r .venv
