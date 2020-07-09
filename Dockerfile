FROM python:3.7.7-slim

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# COPY test-requirements.txt ./
# RUN pip install --no-cache-dir -r test-requirements.txt

COPY * ./

COPY core_decision_flask_app.py ./
COPY coreDecision.py ./
COPY parameters.json ./
# COPY tests/unit/* /opt/microservices/
# COPY templates /opt/microservices/templates
# COPY static /opt/microservices/static
COPY requirements.txt ./

# ARG flood_factor
# ENV FLOOD_FACTOR ${flood_factor:-0}

EXPOSE 8080
WORKDIR ./
# RUN python -m unittest discover

CMD ["python", "core_decision_flask_app.py", "8080"]