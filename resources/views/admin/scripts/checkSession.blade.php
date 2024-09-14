<script>
     var initialDelay = 7200000   // 120 menit (2 jam)

    var idle = new IdleJs({
        events: ['mousemove', 'keydown', 'mousedown', 'touchstart'],
        onIdle: function() {
         Swal.fire({
                title: 'Waktu Sesi Telah Habis',
                text: "Sesi Anda telah habis karena tidak ada aktivitas, Silakan login kembali untuk melanjutkan.",
                icon: 'warning',
                confirmButtonColor: '#3085d6',
                allowOutsideClick: false,
                confirmButtonText: 'Login'
            }).then((result) => {
                if (result.isConfirmed) {
                  // window.location.replace(route('logout'))
                  window.location.replace( route('login.form'))
                }
            })
        },
        onActive: function() {
        
        },
        onHide: function() {

        },
        onShow: function() {
        
        },
        idle: initialDelay,
        keepTracking: true
    }).start();
</script>
