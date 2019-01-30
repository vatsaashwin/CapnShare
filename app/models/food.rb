class Food < ApplicationRecord	
    has_attached_file :image,
        url: "/system/:hash.:extension",
        hash_secret: "ENTER HASH KEY",
        
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
