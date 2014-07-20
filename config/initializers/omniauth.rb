Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '470100966460106', '91d41049fb2e834637fcc1c5fc0276fc'
end