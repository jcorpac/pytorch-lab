FROM pytorch/pytorch:latest

# Set the working directory
WORKDIR /torch

# Install additional libraries
RUN apt-get update && apt-get install -y libhdf5-dev git

# Copy the requirements.txt file
COPY requirements.txt /tmp/requirements.txt

# Install the requirements
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Set pytorch as keras backend
ENV KERAS_BACKEND=torch

# Expose port 8888 for JupyterLab
EXPOSE 8888

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
