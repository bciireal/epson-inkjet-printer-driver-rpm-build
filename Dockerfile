FROM fedora:44 AS builder

WORKDIR /workspace
COPY assets/ .
RUN dnf dsync -y && \
    dnf install 7zip rpm-build rpmdevtools -y && \
    dnf builddep epson-inkjet-printer-escpr.spec -y && \
    rpmdev-setuptree && \
    ./curl_download.sh \
    https://download-center.epson.com/f/module/e934c1f6-0fc1-43e5-8d3e-0de8f3a3d357/epson-inkjet-printer-escpr-1.8.8-1.src.rpm && \
    sha256sum -c checksums.sha256 && \
    7z x -o. epson-inkjet-printer-escpr-1.8.8-1.src.rpm && \
    7z x -o/root/rpmbuild/SOURCES epson-inkjet-printer-escpr-1.8.8-1.src.cpio && \
    cp epson-inkjet-printer-escpr.spec ~/rpmbuild/SPECS && \
    rpmbuild -bb ~/rpmbuild/SPECS/epson-inkjet-printer-escpr.spec

FROM scratch
COPY --from=builder /root/rpmbuild/RPMS /
