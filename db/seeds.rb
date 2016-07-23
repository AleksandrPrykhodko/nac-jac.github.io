CartItem.delete_all
Cart.delete_all
Product.delete_all

Product.create(
    [
        {
            id: 1,
            title: 'NAC-JAC TRAY',
            slug: 'nac-jac-tray',
            notes: '---',
            description: '$16.99',
            photo_url: 'products/NAC-JAC-TRAY.jpg',
            price: 16.99
        },
        {
            id: 2,
            title: 'NAC-JAC FILE FOLDERS',
            slug: 'nac-jac-file-folders',
            notes: 'Save & $3.99',
            description: '$16.99 & OR Two for $30',
            photo_url: 'products/NAC-JAC-FILE-FOLDERS.jpg',
            price: 16.99
        },
        {
            id: 3,
            title: 'NAC-JAC TRAYS',
            slug: 'NAC-JAC-TRAYS',
            notes: 'Set of Four --Save $7.99',
            description: '$60',
            photo_url: 'products/NAC-JAC-TRAYS.jpg',
            price: 60.00
        },
        {
            id: 4,
            title: 'Nac-Jac best Value',
            slug: 'nac-jac-best-value',
            notes: '2 Tray 2 folders',
            description: '$249.00',
            photo_url: 'products/NAC-JAC-BEST-VALUE.jpg',
            price: 249.00
        }
    ])
