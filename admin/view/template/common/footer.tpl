<footer class="main-footer" style="font-family: 'Source Sans Pro'; ">
            <div title="" data-original-title="" class="pull-right hidden-xs">
                <span class="pull-right"><b>Phiên bản</b> 3.0.12</span>
            </div>
            <strong>© 2021
                Trang Thông tin điện tử Hội khuyến học tỉnh Sơn La
            </strong><br>
            Địa chỉ:
            Số 06, ngõ 2A, phố Xuân Thủy, tổ 8, phường Chiềng Lề, thành phố Sơn La, tỉnh Sơn La <br> Điện thoại:
            02123.857.571 - Fax:
            0212.3857.602 <br> Email:
            khuyenhocsonla@gmail.com <label id="lblChatRoom" style="display:none"></label>
        </footer>


    </div>
    <script type="text/javascript" src="assets/plugins/ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="assets/plugins/ckeditor/ckeditor.js"></script>

    <script src="assets/js/adminlte.min.js"></script>
    <!--<script src="assets/js/jquery.number.min.js"></script>-->
    <!--<script src="assets/js/jquery.unobtrusive-ajax.min.js"></script>-->
    <!--<script src="assets/js/jquery.validate.min.js"></script>-->
   <!-- <script src="assets/js/jquery.validate.unobtrusive.min.js"></script>-->
   <!-- <script src="assets/js/knockout-2.2.0.js"></script>-->
  
    <!--<script src="assets/js/jquery.treegrid.min.js"></script>-->
    <!--<script src="assets/js/app.js"></script>-->
    <!--<script src="assets/js/printThis.js"></script>-->
    <script src="./assets/plugins/sweetalert/sweetalert2.min.js"></script>
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>-->


    <script src="assets/js/customize/common.js"></script>
    <script src="assets/dist/toast/js/jquery.toast.min.js"></script>


    <script>
        $("input.print-page").click(function () {
            $('.form').printThis(
                {
                    debug: false,
                    importCSS: true,
                    importStyle: false,
                    header: null,
                    footer: null,
                    pageTitle: "",
                    printContainer: true
                });
        });
    </script>

    <script>
        $("button[type=reset]").on("click", function () {
            $("button[type=submit]").submit();
            window.location.reload(true);
            $(".pagination-container").addClass("text-right");

        });
        function success() {
            $(".pagination-container").addClass("text-right");
        }
    </script>


    <script type="text/javascript">
        function confirmDelete(delUrl) {
            if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
                document.location = delUrl;
            }
        }
    </script>




    <script type="text/javascript">

        function BrowseServer() {
            // You can use the "CKFinder" class to render CKFinder in a page:
            var finder = new CKFinder();
            finder.basePath = 'assets/plugins/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
            finder.selectActionFunction = SetFileField;
            finder.popup();
        }

        function BrowseServer1() {
            var finder1 = new CKFinder();
            finder1.basePath = 'assets/plugins/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
            finder1.selectActionFunction = SetFileField1;
            finder1.popup();
        }


        // This is a sample function which is called when a file is selected in CKFinder.
        function SetFileField(fileUrl) {
            document.getElementById('xFilePath').value = fileUrl;
        }


        function SetFileField1(fileUrl) {
            document.getElementById('xFilePath1').value = fileUrl;
        }

    </script>

    

    <script type="text/javascript" src="assets/dist/jquery-ui/js/jquery-ui.js"></script>
    



    <div id="sb-container">
        <div id="sb-overlay"></div>
        <div id="sb-wrapper">
            <div id="sb-title">
                <div id="sb-title-inner"></div>
            </div>
            <div id="sb-wrapper-inner">
                <div id="sb-body">
                    <div id="sb-body-inner"></div>
                    <div id="sb-loading">
                        <div id="sb-loading-inner"><span>loading</span></div>
                    </div>
                </div>
            </div>
            <div id="sb-info">
                <div id="sb-info-inner">
                    <div id="sb-counter"></div>
                    <div id="sb-nav"><a id="sb-nav-close" title="Close" onclick="Shadowbox.close()"></a><a
                            id="sb-nav-next" title="Next" onclick="Shadowbox.next()"></a><a id="sb-nav-play"
                            title="Play" onclick="Shadowbox.play()"></a><a id="sb-nav-pause" title="Pause"
                            onclick="Shadowbox.pause()"></a><a id="sb-nav-previous" title="Previous"
                            onclick="Shadowbox.previous()"></a></div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>