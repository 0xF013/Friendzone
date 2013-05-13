Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'auK6r0SZ7O6w089GzCodQ', 'npVrFCSkwuvzhX6NXte16jlvV4OClYNhTDpebw'
  provider :instagram, 'ed76321ab1ac47b3b5b8c0734872b446', '358a7a2da8f5449db246c19190e2c8e0'
  provider :facebook, '495002980572981', 'df60518bf69c76a9f1ce02130dc3d0f3'
  provider :google_oauth2, '839332125236.apps.googleusercontent.com', 'LrdHSRLcT5z9PE7hV77TzLXu'
end