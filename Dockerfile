FROM python:3.7.7-slim

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# COPY test-requirements.txt ./
# RUN pip install --no-cache-dir -r test-requirements.txt

COPY src/core_decision_flask_app.py /opt/microservices/
COPY src/coreDecision.py /opt/microservices/
COPY src/parameters.json /opt/microservices/
# COPY tests/unit/* /opt/microservices/
# COPY templates /opt/microservices/templates
# COPY static /opt/microservices/static
COPY requirements.txt /opt/microservices/

# ARG flood_factor
# ENV FLOOD_FACTOR ${flood_factor:-0}

EXPOSE 8080
WORKDIR /opt/microservices/
# RUN python -m unittest discover

CMD ["python", "core_decision_flask_app.py", "8080"]