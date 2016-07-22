Product.delete_all
Product.create(
    [
        {
            id: 1,
            title: 'NAC-JAC TRAY',
            slug: 'NAC-JAC-TRAY',
            description: 'Tray description',
            notes: '<del>$20</del>$16.99 <span class="label label-default">early bird offer</span>',
            photo_url: 'products/NAC-JAC-TRAY.jpg',
            price: 16.99
        },
        {
            id: 2,
            title: 'NAC-JAC FILE FOLDERS',
            slug: 'NAC-JAC-FILE-FOLDERS',
            description: 'Folders description',
            notes: '<del>$20</del>$16.99 <span class="label label-default">early bird offer</span>',
            photo_url: 'products/NAC-JAC-FILE-FOLDERS.jpg',
            price: 16.99
        },
        {
            id: 4,
            title: 'NAC-JAC TRAYS',
            slug: 'NAC-JAC-TRAYS',
            description: 'Trays description',
            notes: '<del>$72</del>$60.00 <span class="label label-default">early bird offer</span>',
            photo_url: 'products/NAC-JAC-TRAYS.jpg',
            price: 60.00
        }
    ])
