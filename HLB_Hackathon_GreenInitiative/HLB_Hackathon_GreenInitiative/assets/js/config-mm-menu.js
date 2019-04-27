jQuery(document).ready(function( $ ) {
  $("nav#menu").mmenu({
     "extensions": [
        "pagedim-black",
        "shadow-page"
     ],
     "offCanvas": {
        zposition   : "front"
     },
    // "searchfield" : {
    // "placeholder" : 'Need some fresh vegatables?'
    //},
    "navbar" : {
            title : 'Pink Blossom Florist'
          },
     "navbars": [
        {
           "position": "top",
           "content": [
             '<a href="Home.aspx"><img src="assets/images/logo-4.png" class="img-responsive" alt="Image"></a>'
           ]
        },
        //{
        //  "position"  : 'top',
        //  "content"   : [ 'searchfield' ]
         //}, 
         {
          "position"  : 'top',
          "content"   : [ 'breadcrumbs' ]
        },
        {
           "position": "bottom",
           "content": [
              //"<a class='fa fa-envelope' href='#/'></a>",
              //"<a class='fa fa-twitter' href='#/'></a>",
              "<a class='fa fa-facebook' href='https://www.facebook.com/pinkblossomflorist/'></a>"
           ]
        }
     ]
  });
});