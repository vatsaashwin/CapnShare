class Food < ApplicationRecord	
    has_attached_file :image,
        url: ":s3_domain_url",
        path: "/:class/:id",
        #hash_secret: "ENTER HASH KEY",        
        styles: {
                    thumb: ["300x300", :jpeg],
                    original: [:jpeg]
                },
        convert_options: {
                       thumb: "-quality 70 -strip",
                       original: "-quality 50"
                },
        storage: :s3,
        s3_credentials: {
                    access_key_id: "ENTER ID HERE",
                    secret_access_key: "ENTER KEY HERE",
                    bucket: "ENTER BUCKET NAME HERE",
                    host_name: "ENTER HOST NAME HERE"
                },
        s3_region: "ENTER REGION HERE"
        #s3_permissions: "public"

    validates_attachment :image,
                    content_type: { content_type: /\Aimage\/.*\z/ },
                    size: { less_than: 5.megabyte }
end
