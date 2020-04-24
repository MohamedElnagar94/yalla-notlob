// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// require("jquery")
// import "jquery"
// import "bootstrap"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("jquery")
// import $ from 'jquery';
// import 'select2';
// import 'select2/dist/css/select2.css';
// $.ajax({
//     url: "/groups.json",
//     method: "get",
// //        data: {"email": email, "password": password},
//     dataType: "json",
//     success: function (result) {
// //            console.log(result)
//         result.forEach(function (value,index) {
//             console.log(value.group_name)
//         })
//     },
//     error: function (error) {
//         console.log(error)
//     }
// });
// $(document).ready(function () {
//     let buttonGroupAdd = $(".buttonAddGroup");
//     let AllGroups = $(".AllGroups");
//     let deleteGroup = $(".deleteGroup");
//     let noGroups = $(".noGroups");
//     let addFriends = $(".addFriends");
//     let checkGroupCount = AllGroups.children()[0].childElementCount;
//     if(checkGroupCount <= 2){
//         noGroups.removeClass("d-none")
//     }
//     $("#add_group_form").on("ajax:complete",function (event,data,status) {
//         console.log(data,event,status)
//         // $('.AllGroups').html("<%= j (render partial: 'groups/result') %>")
//         // $(".AllGroups").html(data.responseText);
//         let groupValue = $(".inputGroup");
//         // let component = $(".groups").clone(true);
//         // component.removeClass("groups d-none").find(".groupName").text(groupValue.val());
//         // AllGroups.append(component);
//         groupValue.val("");
//         checkGroupCount = AllGroups.children()[0].childElementCount;
//         if(checkGroupCount > 2){
//             noGroups.addClass("d-none")
//         }
//     });
//     // $('.buttonAddGroup').bind('ajax:comp', function(e) {
//     //     // $(this).closest('tr').fadeOut();
//     //     // console.log("delete")
//     //     console.log("created success",e)
//     // });
//     deleteGroup.bind('ajax:success', function(e) {
//         $(this).closest('tr').fadeOut();
//         $(this).closest('tr').remove();
//         // console.log("created success",e)
//         let checkGroupCount = AllGroups.children()[0].childElementCount;
//         if(checkGroupCount <= 2){
//             noGroups.removeClass("d-none")
//         }
//     });
//     // buttonGroupAdd.on("click", function (e) {
//     //     let groupValue = $(".inputGroup");
//     //     let component = $(".groups").clone(true);
//     //     component.removeClass("groups d-none").find(".groupName").text(groupValue.val());
//     //     AllGroups.append(component);
//     //     groupValue.val("");
//     //     checkGroupCount = AllGroups.children()[0].childElementCount;
//     //     if(checkGroupCount > 2){
//     //         noGroups.addClass("d-none")
//     //     }
//     // });
//     // deleteGroup.on("click",function (e) {
//     //     e.preventDefault();
//     //     $(this).parent().parent().remove();
//     //     let checkGroupCount = AllGroups.children()[0].childElementCount;
//     //     if(checkGroupCount <= 2){
//     //         noGroups.removeClass("d-none")
//     //     }
//     // })
// });
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
