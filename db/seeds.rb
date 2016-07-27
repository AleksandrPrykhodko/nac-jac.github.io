CartItem.delete_all
Cart.delete_all
Product.delete_all

Product.create(
    [
        {
            id: 1,
            title: 'NAC-JAC TRAY',
            slug: 'nac-jac-tray',
            notes: 'Per Tray',
            description: '$14.75',
            photo_url: 'products/NAC-JAC-TRAY.jpg',
            price: 14.75
        },
        {
            id: 2,
            title: 'NAC-JAC FILE FOLDERS',
            slug: 'nac-jac-file-folders',
            notes: 'Per Folder',
            description: '$15.25',
            photo_url: 'products/NAC-JAC-FILE-FOLDERS.jpg',
            price: 15.25
        },
        # {
        #     id: 3,
        #     title: 'NAC-JAC TRAYS',
        #     slug: 'NAC-JAC-TRAYS',
        #     notes: '---',
        #     description: '$60',
        #     photo_url: 'products/NAC-JAC-TRAYS.jpg',
        #     price: 60.00
        # },
        {
            id: 4,
            title: 'NAC-JAC Best Value',
            slug: 'nac-jac-best-value',
            notes: '4 Tray 2 folders',
            description: '$82.50',
            photo_url: 'products/NAC-JAC-BEST-VALUE.jpg',
            price: 82.50
        }
    ])
