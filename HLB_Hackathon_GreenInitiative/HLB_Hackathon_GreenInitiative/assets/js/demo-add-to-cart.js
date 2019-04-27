'use strict';
$(function () {
    var actionAddToCart = $('.js-action-add-cart');
    var cart = $('.js-widget-shop-cart');
    var itemWishList = $('.js-notify-add-wish-list');

    actionAddToCart.each(function () {
        $(this).on('click', function (e) {
            var productName = $(this).closest('.product').find('.product-name').text();
            var MPM_GUID = $(this).data("mpmguid");
            var MPO_GUID = $(this).data("mpoguid");
            e.preventDefault();

            var itemList = loadCartItems_ASPX_CS("/ProductList.aspx");

            notifyAddToCart(productName);

            addToCart_ASPX_CS("/ProductList.aspx", { MPO_GUID: MPO_GUID, BOD_QUANTITY:1 });
            $(this).addClass('is-added');
            setTimeout(function () {
                updateCart();
                actionAddToCart.removeClass('is-added');
            }, 1000);            
        });
    });

    itemWishList.on("click", function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
        var productName = $(this).closest('.product').find('.product-name').text();
        if ($(this).hasClass('active')) {
            addToWishList(productName);
        } else {
            removeFromWishList(productName);
        }
    });

    function updateCart() {
        //show counter if this is the first item added to the cart
        (!cart.hasClass('items-added')) && cart.addClass('items-added');
        var cartItems = cart.find('.counter'),
            text = parseInt(cartItems.text()) + 1;
        cartItems.text(text);
    };

    function notifyAddToCart(productName) {
        $.notify({
            title: productName,
            icon: 'lnr lnr-cart',
            message: "is added to cart."
        }, {
                type: 'success',
                animate: {
                    enter: 'animated fadeInUp',
                    exit: 'animated fadeOut'
                },
                placement: {
                    from: "bottom",
                    align: "right"
                },
                offset: 20,
                spacing: 10,
                z_index: 1031,
            });
    };

    function notifyAlreadyAdded(productName) {
        $.notify({
            title: productName,
            icon: 'lnr lnr-cart',
            message: "is already added."
        }, {
                type: 'warning',
                animate: {
                    enter: 'animated fadeInUp',
                    exit: 'animated fadeOut'
                },
                placement: {
                    from: "bottom",
                    align: "right"
                },
                offset: 20,
                spacing: 10,
                z_index: 1031,
            });
    };

    function addToWishList(productName) {
        $.notify({
            title: productName,
            icon: 'lnr lnr-heart',
            message: "is added to wish list"
        }, {
                type: 'success',
                animate: {
                    enter: 'animated fadeInUp',
                    exit: 'animated fadeOut'
                },
                placement: {
                    from: "bottom",
                    align: "right"
                },
                offset: 20,
                spacing: 10,
                z_index: 1031
            });
    };

    function removeFromWishList(productName) {
        $.notify({
            title: productName,
            icon: 'lnr lnr-heart',
            message: "is removed from wish list"
        }, {
                type: 'danger',
                animate: {
                    enter: 'animated fadeInUp',
                    exit: 'animated fadeOut'
                },
                placement: {
                    from: "bottom",
                    align: "right"
                },
                offset: 20,
                spacing: 10,
                z_index: 1031,
            });
    };


});