import os

# Flask configuration
SECRET_KEY = "{{notifico.secret_key}}"

# Database configuration
db_path = os.path.abspath(os.path.join(os.getcwd(), "notifico.db"))
SQLALCHEMY_DATABASE_URI = "sqlite:///{0}".format(db_path)

# IRC configuration
IRC_NICKNAME = "_whitenotifier"
IRC_USERNAME = u"notifico"
IRC_REALNAME = u"whitequark's notifico instance"

# Service integration
SERVICE_GITHUB_CLIENT_ID = "{{notifico.github_client_id}}"
SERVICE_GITHUB_CLIENT_SECRET = "{{notifico.github_client_secret}}"

# Web interface configuration
NOTIFICO_ROUTE_STATIC = False
NOTIFICO_NEW_USERS = False
