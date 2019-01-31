class Food < ApplicationRecord	
    has_attached_file :image,
        url: "/system/:hash.:extension",
        # hash_secret: "ENTER HASH KEY",
        hash_secret: "a6af45ff44b8b2227721db2920dee251cf5f597bc463201dd33d97924e797d3cdd05fe765289c2efabc34ad3e3a0174a3e490b4b0f1a6dd9397d1567cbf3d300",
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
