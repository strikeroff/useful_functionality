call gem uninstall useful_functionality
del /Q pkg
call rake manifest
call rake install
cd pkg
call gem install useful_functionality-0.1.0
cd ..