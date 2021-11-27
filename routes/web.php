<?php //b4f2e6d787e3632e35b6465fb958eef5

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::middleware(['web', 'subscribed'])->group(function () {
//     //
// });

        Route::get('/', 'Auth\LoginController@index');
        Route::get('login', 'Auth\LoginController@index')->name('login');
        Route::post('/sing-in', [ 'as' => '/sing-in', 'uses' => 'Auth\LoginController@singIn']);
        Route::post('/log-out', [ 'as' => '/log-out', 'uses' => 'Auth\LoginController@logOut']);

        Route::group(['middleware' => 'auth'], function () {
            Route::get('/home', 'HomeController@index')->name('home');
            Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
            Route::get('/get-menus-user-session', 'MenuController@getMenusUserSession');
            Route::get('/get-request', 'RequestUserController@getRequest')->name('/get-request');//

        
            Route::group(['middleware' => 'applicant'], function () {
                /**Rutas de usuarios */
                Route::get('/users',              'UserController@index');
                Route::get('/get-user',           'UserController@getUser')->name('/get-user');
                Route::get('/users/create',       'UserController@index');
                Route::get('/users/edit/{id}',    'UserController@index');
                Route::post('/user-store',        'UserController@store');
                Route::post('/user-update',       'UserController@update');
                Route::post('/user-status',       'UserController@status');
                Route::get('/users-table-list',   'UserController@getTableList');

                 /**Rutas de solicitud por gestionar */
                Route::get('/request/manage',                        'RequestManageController@index');
                Route::get('/request/manage/apply/{id}',             'RequestManageController@index');
                Route::get('/request/manage/edit/{id}',              'RequestManageController@index');
                Route::get('/request/manage/see-accreditation/{id}', 'RequestManageController@index');
                Route::get('/request-manage-table-list',             'RequestManageController@getTableList')->name('/request-manage-table-list');
                Route::get('/get-list-tariff-manage',                'RequestManageController@getListTarifManage')->name('/get-list-tariff-manage');
                /**Rutas de solicitud cuya gestión esta pendiente de aprovación */
                Route::get('/request/manage-approve',       'ManageApproveController@index');
                Route::get('/request/manage-approve/apply', 'ManageApproveController@index');
                Route::get('/manage-approve-table-list',    'ManageApproveController@getTableList')->name('/manage-approve-table-list');
                /**Rutas de gestión de solicitudes */                    
                Route::post('/management-store',     'ManagementController@postManagement')->name('/management-store');
                /**Rutas de tipos */
                Route::get('/list-types-management', 'TypeController@getManagementList')->name('/list-types-management');
                Route::get('/types',                 'TypeController@index');
                Route::get('/type/create',           'TypeController@index');
                Route::get('/type/edit/{id}',        'TypeController@index');
                Route::get('/types-table-list',      'TypeController@getTableList');
                Route::get('/get-type',              'TypeController@getType')->name('/get-type');
                Route::post('/type-store',           'TypeController@store');
                Route::post('/type-update',          'TypeController@update');
                Route::post('/type-status',          'TypeController@status');
                
                /**Rutas de viáticos */
                Route::get('/viatics',            'ViaticController@index');
                Route::get('/viatics/create',     'ViaticController@index');
                Route::get('/viatics/edit/{id}',  'ViaticController@index');
                Route::get('/viatics-table-list', 'ViaticController@getTableList');
                Route::get('/get-viatic',         'ViaticController@getViatic')->name('/get-viatic');
                Route::post('/viatic-store',      'ViaticController@store');
                Route::post('/viatic-update',     'ViaticController@update');
                Route::post('/viatic-status',     'ViaticController@status');

                /**Rutas de catálogo */
                Route::get('/catalogue',            'CatalogueController@index');
                Route::get('/catalogue/create',     'CatalogueController@index');
                Route::get('/catalogue/edit/{id}',  'CatalogueController@index');
                Route::get('/catalogue/{id}/rates', 'CatalogueController@index');
                Route::get('/catalogue-table-list', 'CatalogueController@getTableList'); 
                Route::get('/get-catalogue',        'CatalogueController@getCatalogue')->name('/get-catologue');
                Route::post('/catalogue-store',     'CatalogueController@store');
                Route::post('/catalogue-update',    'CatalogueController@update');
                Route::post('/catalogue-status',    'CatalogueController@status');
                Route::post('/catalogue-rates',     'CatalogueController@storeRates');
                Route::post('/rate-status',         'CatalogueController@rateStatus');

            });
            Route::group(['middleware' => 'admin'], function () {
                /**Rutas de gestiones por aprobar */
                Route::get('/manage/approve',            'ManageApproveController@index');
                Route::get('/manage/approve/see/{id}',   'ManageApproveController@index');
                Route::post('/manage-approve-apply',     'ManageApproveController@apply');

                /**Rutas de solicitud por aprobar */
                Route::get('/request/approve',                     'RequestApproveController@index');
                Route::get('/request/approve/see/{id}',            'RequestApproveController@index');
                Route::get('/request/approve/see-final/{id}',            'RequestApproveController@index');

                Route::get('/request/approve/approve-manage/{id}', 'RequestApproveController@index');
                Route::get('request-approve-table-list',           'RequestApproveController@getTableList')->name('/request-approve-table-list');
                Route::post('/request-approve-apply',              'RequestApproveController@apply');

       
            });

            // Route::group(['middleware' => 'travel'], function () {
                 /**Rutas de solicitud usuario */
                Route::get('/request/user',               'RequestUserController@index');
                Route::get('/request/user/create',        'RequestUserController@index');
                Route::get('/request/user/see/{id}',      'RequestUserController@index');
                Route::get('/request/user/edit/{id}',     'RequestUserController@index');
                Route::get('/request/user/accredit/{id}', 'RequestUserController@index');
                Route::get('/request-user-table-list',    'RequestUserController@getTableList')->name('/request-user-table-list');
                Route::post('/request-user-store',        'RequestUserController@store');
                Route::post('/request-user-update',       'RequestUserController@update');
                Route::post('/request-user-payment',      'RequestUserController@postRequestPayments');
                Route::post('/payment-status',            'RequestUserController@paymentStatus');
                Route::post('/store-file',                'RequestUserController@fileStore');
                Route::get('/request-files',              'RequestUserController@getRequestFiles');
                Route::post('/delete-picture',            'RequestUserController@postDeletePicture');
                Route::post('/payment-delete-row',        'RequestUserController@postDeletePaymentRow');
           // });
            Route::get('/type-list-select-box', 'TypeController@getListSelectBox')->name('type-list-select-box');
            Route::get('/get-catalogue-rates',  'CatalogueController@getCatalogueRates')->name('/get-catologue-rates');

            Route::get('/user-traveler-list', 'UserController@getTravelerList')->name('/user-traveler-list');
           
        /**Tutas de áreas */
            Route::get('/area-list-select-box', 'AreaController@getListSelectBox')->name('/area-list-select-box');

        /**Tutas de perfiles */
            Route::get('/profile-list-select-box', 'ProfileController@getListSelectBox')->name('/profile-list-select-box');

        /**Rutas de región */
            Route::get('/region-list', 'RegionController@getList')->name('/region-list');
        
        /**Rutas de comunas */
            Route::get('/commune-list', 'CommuneController@getList')->name('/commune-list');        
        /**Rutas de codigos */
            Route::get('/list-codes-management', 'CodeController@getManagementList')->name('/list-codes-management');
            Route::get('/code-list-select-box', 'CodeController@getListSelectBox')->name('/code-list-select-box');

        /**Rutas de administrables historial de tarifas */
            Route::get('/list-management', 'ManagementController@getManagementList')->name('/list-management');

        /**Rutas de tarifas */
            Route::get('/list-rate-management', 'RateController@getManagementList')->name('/list-rate-management');
            Route::get('/list-request-rates', 'RateController@getRequestRates')->name('/list-request-rates');

        /**Rutas info widgets */
            Route::get('/get-info-widgets-requests-month', 'WidgetController@getWidgetRequestInfoMonth')->name('/get-info-widgets-requests-month');
            Route::get('/get-requests-for-state-widget',   'WidgetController@requestsForState')->name('/get-requests-for-state-widget');

        
        });//Fin de las rutas auth




