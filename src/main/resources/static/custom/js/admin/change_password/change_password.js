$(document).ready(function () {

    $(document).on("click", "#change_password", function () {
        $("#modal_change_password").modal("show");
    })

    let changePasswordVue = new Vue({
        el: "#modal_change_password",
        data: {
            currentPassword: "",
            newPassword: "",
            confirmNewPassword: "",
        },
        methods: {
            changePassword() {
                if (!$("#form-change-password").valid()) {
                    return;
                }

                let data = {
                    currentPassword: this.currentPassword,
                    newPassword: this.newPassword,
                }

                $.ajax({
                    type: "POST",
                    url: "/api/user/changePassword",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    beforeSend: function () {
                        window.loader.show();
                    },
                    success: function (response) {
                        window.loader.hide();
                        if (response.status.code === 1000) {
                            $("#modal_change_password").modal("hide");
                            window.alert.show("success", "Đổi mật khẩu thành công", 2000);
                        } else if (response.status.code === 1002) {
                            window.alert.show("error", "Mật khẩu hiện tại không chính xác", 2000);
                        } else {
                            window.alert.show("error", "Đã có lỗi xảy ra, vui lòng thử lại sau", 2000);
                        }
                    }
                })
            }
        },
        mounted() {
            $("#form-change-password").validate({
                errorElement: "p",
                errorClass: "error-message",
                errorPlacement: function (error, element) {
                    error.insertBefore(element);
                },
                ignore: [],
                rules: {
                    currentPassword: {
                        required: true,
                    },
                    newPassword: {
                        required: true,
                        minlength: 8,
                        maxlength: 32,
                        notEqualCurrentPassword: true,
                    },
                    confirmNewPassword: {
                        required: true,
                        equalTo: "#newPassword"
                    }
                },
                messages: {
                    currentPassword: {
                        required: "Trường này là bắt buộc",
                    },
                    newPassword: {
                        required: "Trường này là bắt buộc",
                        minlength: "Mật khẩu từ 8 đến 32 ký tự",
                        maxlength: "Mật khẩu từ 8 đến 32 ký tự",
                    },
                    confirmNewPassword: {
                        required: "Trường này là bắt buộc",
                        equalTo: "Mật khẩu mới và mật khẩu mới xác nhận không khớp",
                    },
                }
            });

            $.validator.addMethod("notEqualCurrentPassword", function (value) {
                return value !== $("#currentPassword").val();
            }, "Mật khẩu mới không được trùng mật khẩu hiện tại")
        }
    })
})