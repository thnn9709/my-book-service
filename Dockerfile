FROM xhofe/alist:latest
EXPOSE 5244
CMD ["/opt/alist/alist", "server", "--no-prefix", "--env-prefix", "ALIST_"]
