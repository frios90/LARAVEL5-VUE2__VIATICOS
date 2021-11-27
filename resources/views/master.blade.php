<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Sofag</title>
  <link rel="stylesheet"    href="{{ asset('template/vendors/mdi/css/materialdesignicons.min.css') }}">
  <link rel="stylesheet"    href="{{ asset('template/vendors/base/vendor.bundle.base.css') }}">  
  <link rel="stylesheet"    href="{{ asset('template/css/style.css') }}">
  <link rel="shortcut icon" href="{{ asset('template/images/favicon.png') }}" />
  <link rel="stylesheet"    href="{{ asset('css/owner.css') }}">

  <meta name="csrf-token" content="{{ csrf_token() }}">
  
</head>
<body>
  <div class="container-scroller" id="app">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-sort-variant"></span>
          </button>
        </div>  
      </div>
      <app-nav></app-nav> 

      </nav>
      <div class="container-fluid page-body-wrapper" >
        <app-menu></app-menu> 
        <div class="main-panel">    
          <app id="app-container-root" class="app-container-root"></app>
          
        </div>  
      </div> 
    </div>    
  </div>
  <script src="{{ asset('js/app.js') }}"></script> 
  <script src="{{ asset('template/vendors/base/vendor.bundle.base.js') }}"></script>  
  <script src="{{ asset('template/js/off-canvas.js') }}"></script>
  <script src="{{ asset('template/js/hoverable-collapse.js') }}"></script>
  <script src="{{ asset('template/js/template.js') }}"></script>
  <script type="text/javascript">
</script>
  @yield('script')
</body>

</html>
