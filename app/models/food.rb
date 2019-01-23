class Food < ApplicationRecord	
    has_attached_file :image,
        url: "/system/:hash.:extension",
        hash_secret: "2b47091e08024ee2e9664f41b438b64b27b29c4e63e6c789a1380e446f0904ce29456ea12f227036395e7a7353d677681569443d275c125036bc3cbddee3f6d5",
        styles: {
                    thumb: ["300x300", :jpeg],
                    original: [:jpeg]
                    },
                    convert_options: {
                       thumb: "-quality 70 -strip",
                       original: "-quality 50"
                }
    validates_attachment :image,
                    content_type: { content_type: /\Aimage\/.*\z/ },
                    size: { less_than: 1.megabyte }
                                        
    
end
