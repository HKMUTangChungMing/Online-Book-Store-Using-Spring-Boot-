<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book information operations</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cropper.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ImgCropping.css">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>

        <div class="container user-info">
            <div class="breadcrumb">
                <span onclick="location.href='index'">front page></span>
                <span>manage></span>
                <span>Book management></span>
                <span>Book content management</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li class="on"><a href="#">Book Management</a></li>
                    <li onclick="location.href='users'"><a href="#">User Management</a></li>
                    <li onclick="location.href='comments'"><a href="#">Comment Management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-message">
                <div class="user-message-content">
                    <div class="message-tag">
                        <ul class="nav nav-tabs taghead" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">Book content management</a>
                            </li>
                        </ul>
                        <div class="tagbody tab-content">
                            <!-- Book content editor -->
                            <div role="tabpanel" class="tab-pane active" id="activity">
                                <div class=" information" style="border: none">
                                    <div class="form-user-info">
                                        <form name="myForm" class="form-signin" action="insert" method="post" >
                                            <input type="hidden" name="id" value="${book.id}">
                                            <div class="form-info-item">
                                                <span class="info-label">cover</span>
                                                <input type="hidden" name="fmimg" id="fmimg" value="${book.fmimg}">
                                                <img src="${book.fmimg}"  class="headerimg" id="replaceImg" style="border-radius: 0;width: 150px;height: 150px">
                                            </div>
                                            <div class="form-info-item">
                                                <span class="info-label">name</span>
                                                <input type="text" placeholder="Please enter the book name" class="nickname" name="name" value="${book.name}">
                                            </div>
                                            <div class="form-info-item">
                                                <span class="info-label">author</span>
                                                <input type="text" placeholder="Please enter the author of the book" class="nickname" name="author" value="${book.author}">
                                            </div>
                                            <div class="form-info-item">
                                                <span class="info-label">price</span>
                                                <input type="text" placeholder="Please enter the book price" class="nickname" name="price" value="${book.price}" >
                                            </div>
                                            <div class="form-info-item">
                                                <span class="info-label">Introduction</span>
                                                <textarea  class="nickname" style="width: 400px;height: 500px;padding: 10px" cols="30"  name="intro" rows="10" placeholder="Please enter a book introduction">${book.intro}</textarea>
                                            </div>
                                            <div class="form-info-item" style="margin-left: 120px;margin-top: 20px">
                                                <button class="order-pay-submit" type="button" onclick="location.href='books'" style="float: none;margin: 0;background: #cccccc">return</button>
                                                <button class="order-pay-submit" type="submit" style="float: none;margin: 0">save</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>

                                <!--图片裁剪框 start-->
                                <div style="display: none" class="tailoring-container">
                                    <div class="black-cloth" onclick="closeTailor(this)"></div>
                                    <div class="tailoring-content">
                                        <div class="tailoring-content-one">
                                            <label title="upload image" for="chooseImg" class="l-btn choose-btn">
                                                <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onchange="selectImg(this)">
                                                Select Image
                                            </label>
                                            <div class="close-tailoring"  onclick="closeTailor(this)">×</div>
                                        </div>
                                        <div class="tailoring-content-two">
                                            <div class="tailoring-box-parcel">
                                                <img id="tailoringImg">
                                            </div>
                                            <div class="preview-box-parcel">
                                                <p>Picture Preview:</p>
                                                <div class="square previewImg"></div>
                                            </div>
                                        </div>
                                        <div class="tailoring-content-three">
                                            <button class="l-btn sureCut" id="sureCut">Enter</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>

        <script src="${pageContext.request.contextPath}/js/cropper.min.js"></script>
        <script>
            if("${message}"){
                $("#replaceImg").hide();
            }
            setTimeout(function () {
                if("${message}"){
                    alert("${message}");
                    window.location.href="books";
                }
            },500);
            //Pop-up box horizontally and vertically centered
            (window.onresize = function () {
                var win_height = $(window).height();
                var win_width = $(window).width();
                if (win_width <= 768){
                    $(".tailoring-content").css({
                        "top": (win_height - $(".tailoring-content").outerHeight())/2,
                        "left": 0
                    });
                }else{
                    $(".tailoring-content").css({
                        "top": (win_height - $(".tailoring-content").outerHeight())/2,
                        "left": (win_width - $(".tailoring-content").outerWidth())/2
                    });
                }
            })();

            //Pop up picture cropping box
            $("#replaceImg").on("click",function () {
                $(".tailoring-container").toggle();
            });
            //Image upload
            function selectImg(file) {
                if (!file.files || !file.files[0]){
                    return;
                }
                var reader = new FileReader();
                reader.onload = function (evt) {
                    var replaceSrc = evt.target.result;
                    //Change the picture of cropper
                    $('#tailoringImg').cropper('replace', replaceSrc,false);//Default is false, adapts to height without distortion
                }
                reader.readAsDataURL(file.files[0]);
            }
            //cropper picture cropping
            $('#tailoringImg').cropper({
                aspectRatio: 1/1,//proportionality
                preview: '.previewImg',//preview view
                guides: false,  //judging frame's false line (nine lines)
                autoCropArea: 1,  //number between 0-1, fixed size of automatic pruning area, value 0.8
                movable: false, //Whether to allow moving pictures
                dragCrop: true,  //Whether to allow the current cropping frame to be removed and a new cropping frame area to be created by dragging
                movable: true,  //Whether to allow moving the cropping frame
                resizable: true,  //Whether to allow changing the size of the cropping box
                zoomable: false,  //Whether to allow scaling of image size
                mouseWheelZoom: false,  //Whether to allow zooming of images using the mouse wheel
                touchDragZoom: true,  //Whether to allow zooming of images via touch movement
                rotatable: true,  //Whether to allow image rotation
                crop: function(e) {
                    // Output result data cropped image。
                }
            });


            //Processing after cropping
            $("#sureCut").on("click",function () {
                if ($("#tailoringImg").attr("src") == null ){
                    return false;
                }else{
                    var cas = $('#tailoringImg').cropper('getCroppedCanvas');//Get the cropped canvas
                    var base64url = cas.toDataURL('image/png'); //Convert to base64 address form
                    $("#replaceImg").prop("src",base64url);//Display as picture
                    $("#fmimg").val(base64url);
                    //Close crop box
                    closeTailor();
                }
            });
            //Close crop box
            function closeTailor() {
                $(".tailoring-container").toggle();
            }


        </script>
    </body>
</html>