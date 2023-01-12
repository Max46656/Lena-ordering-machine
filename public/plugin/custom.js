$("document").ready(function () {
    $("#navbar a,#top").click(function () {
        const theid = $(this).attr("href");
        const val = $(theid).offset().top-$("#navbar").innerHeight()-10
        $("html").animate(
            { scrollTop: val }, 1000, "swing"
        );
    })
    $('#myWorks').slick({
        dots: true,
        infinite: true,
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 3,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
})