.PHONY: django, dramatiq, dramatiqr, test migrate, makemigrations, static, db, loadprod, loadtest, flush, superuser, venv, venvd, ssh, git, poetry, repo

ssh:
	ssh-keygen -t rsa -b 4096 -C "mmlynarik@sk.uss.com" -N '' -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub

git:
	git config --global user.name "Miroslav Mlynarik"
	git config --global user.email "mmlynarik@sk.uss.com"
	git config --global remote.origin.prune true

poetry:
	curl -sSL https://install.python-poetry.org | python3.8 -

repo:
	mkdir python
	cd python; \
	git clone ssh://vdevops.sk.uss.com:22/Esten/UssAi/_git/UssAi
	mv Makefile setup.cfg pyproject.toml poetry.lock python/UssAi/
	cd python/UssAi; \
	code .

venv:
	poetry config virtualenvs.in-project true
	python3.8 -m venv .venv; \
	cp config.env.template config.env; \
	nano config.env
	echo "set -a && . ./config.env && set +a" >> .venv/bin/activate; \
	. .venv/bin/activate; \
	pip install -U pip setuptools wheel; \
	pip install --no-deps django-plotly-dash==2.0.0; \
	poetry install; \
	rm -rf attr_runtime_validation/build
	sudo oh-my-posh --init --shell bash --config ~/.poshthemes/paradox.omp.json)

	if [ -d .venv ]; then
    		. .venv/bin/activate
    		set -a && . .env && set +a
	fi

db:
	docker run -d --name postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -v ${HOME}/data:/var/lib/postgresql/data postgres:15

posh:
	mkdir ~/.poshthemes/
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64
	sudo mv posh-linux-amd64 /usr/local/bin/oh-my-posh
	wget https://raw.githubusercontent.com/mmlynarik/python/master/config/paradox.omp.json
	mv paradox.omp.json ~/.poshthemes/paradox.omp.json
	sudo chmod +x /usr/local/bin/oh-my-posh
	
	# Copy this into ~/.bashrc:
	eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/paradox.omp.json)"

venvd:
	rm -rf .venv

app:
	cd frontend/; \
	python manage.py collectstatic; \
	python manage.py migrate; \
	python manage.py createsuperuser

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

test:
	python -m unittest discover -s tests -t .

superuser:
	cd  frontend/; \
	python manage.py createsuperuser

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
