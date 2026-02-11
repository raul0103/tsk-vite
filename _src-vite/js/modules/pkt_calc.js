import Swiper from "swiper";

try {
  function initPKTCalc() {
    $(".pkt-calc__materials li").click(function () {
      $(this).addClass("active").siblings().removeClass("active");
    });

    $("#sect1").click(function () {
      $("input[id=monpolk]").attr("checked", false);
      $("input[id=sotpolk]").attr("checked", true);
    });

    $("#sect2").click(function () {
      $("input[id=monpolk]").attr("checked", true);
      $("input[id=sotpolk]").attr("checked", false);

      $("#myDropdown").hide();
    });
    //'слушаем" все вводы в input с классом field
    //если есть вхождения симола запятой = заменяем на точку
    $(function () {
      $("input.field").keyup(function () {
        $(this).val($(this).val().replace(/[,]/g, "."));
      });
    });

    (function () {
      $(".pkt-calc__type__list-radio").click(function () {
        $(".pkt-calc__type__img").removeClass(
          "pkt-calc__img-zabor_active pkt-calc__img-arc_active pkt-calc__img-gable_active pkt-calc__img-lean-to_active pkt-calc__img-arcuate_active"
        );
        $(".pkt-calc__img-type").removeClass(
          "pkt-calc__img-zabortype_active pkt-calc__img-arcuatetype_active pkt-calc__img-arctype_active pkt-calc__img-gabletype_active pkt-calc__img-lean-totype_active"
        );
        if ($(this).prop("checked")) {
          if (
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .hasClass("pkt-calc__img-zabor")
          ) {
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .addClass("pkt-calc__img-zabor_active");
            $(".pkt-calc__img-type").addClass("pkt-calc__img-zabortype_active");
          }
          if (
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .hasClass("pkt-calc__img-arc")
          ) {
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .addClass("pkt-calc__img-arc_active");
            $(".pkt-calc__img-type").addClass("pkt-calc__img-arctype_active");
          }
          if (
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .hasClass("pkt-calc__img-gable")
          ) {
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .addClass("pkt-calc__img-gable_active");
            $(".pkt-calc__img-type").addClass("pkt-calc__img-gabletype_active");
          }
          if (
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .hasClass("pkt-calc__img-lean-to")
          ) {
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .addClass("pkt-calc__img-lean-to_active");
            $(".pkt-calc__img-type").addClass(
              "pkt-calc__img-arcuatetype_active"
            );
          }
          if (
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .hasClass("pkt-calc__img-arcuate")
          ) {
            $(this)
              .next()
              .find(".pkt-calc__type__img")
              .addClass("pkt-calc__img-arcuate_active");
            $(".pkt-calc__img-type").addClass(
              "pkt-calc__img-lean-totype_active"
            );
          }
        }
      });
    })();

    (function () {
      $("#zabor").on("change", function () {
        $(".length").show();
        $(".width").hide();
        $(".height").show();
        $(".arc-length").hide();
        $(".skat-1").hide();
        $(".skat-2").hide();
        $(".ortitle").hide();
      });
      $("#lean-to").on("change", function () {
        $(".length").show();
        $(".width").show();
        $(".height").hide();
        $(".arc-length").hide();
        $(".skat-1").hide();
        $(".skat-2").hide();
        $(".ortitle").hide();
      });
      $("#arc").on("change", function () {
        $(".length").show();
        $(".width").show();
        $(".height").show();
        $(".arc-length").show();
        $(".skat-1").hide();
        $(".skat-2").hide();
        $(".ortitle").show();
      });
      $("#gable").on("change", function () {
        $(".length").show();
        $(".width").show();
        $(".height").show();
        $(".arc-length").hide();
        $(".skat-1").show();
        $(".skat-2").show();
        $(".ortitle").show();
      });
      $("#arcuate").on("change", function () {
        $(".length").show();
        $(".height").hide();
        $(".arc-length").show();
        $(".skat-1").hide();
        $(".skat-2").hide();
        $(".width").hide();
        $(".ortitle").hide();
      });

      $(".calculate").on("click", function () {
        function slickCarousel() {
          $(".product-slider").slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: true,
            prevArrow: '<div class="product-slide-back-arrow"></div>',
            nextArrow: '<div class="product-slide-next-arrow"></div>',
            autoplay: true,
            autoplaySpeed: 3000,
            responsive: [
              {
                breakpoint: 992,
                settings: {
                  slidesToShow: 2,
                },
              },
              {
                breakpoint: 768,
                settings: {
                  arrows: true,
                  slidesToShow: 1,
                },
              },
            ],
          });
        }

        var pktmaterials = $("input[name=pkt-calc__materials]:checked").val();
        var construction = $("input[name=construction]:checked").val();
        var exit = 0;
        var html = "";
        let obrlength;
        let obrheight;
        isEmpty($("#obr-length").val())
          ? (exit = 1)
          : (obrlength = $("#obr-length").val());
        isEmpty($("#obr-height").val())
          ? (exit = 1)
          : (obrheight = $("#obr-height").val());
        if (exit) {
          alert("Заполните все поля!");
          return false;
        }

        let lathing_val = lathing(obrlength, obrheight);
        let obrSize = lathing_val.value;
        $(".pkt-calc__result").html(
          (html =
            '<div class="pkt-calc__thickness-result">Толщина листа ' +
            obrSize +
            "</div><br>")
        );

        html += '<span class="pkt-calc__type__title">Вам понадобятся</span>';

        var tolsh = lathing_val.area;
        // var type = $("input[name=material]:checked").val();
        let swiperprod;
        $.ajax({
          url: "/",
          type: "POST",
          data: {
            ajax_action: "pkt-calc",
            tolsh: tolsh,
            // type: type,
          },
          beforeSend: function () {
            $(".pkt-calc__products").css({
              opacity: ".5",
              "pointer-events": "none",
            });
            $(".pkt-calc__products .swiper-wrapper").html("Поиск товаров...");
            $(".pkt-calc__products .swiper-scrollbar").html("");
          },
          complete: function () {
            $(".pkt-calc__products").css({
              opacity: 1,
              "pointer-events": "all",
            });
          },
          success: function (result) {
            result = JSON.parse(result);
            if (result.status) {
              // $(".pkt-calc__products").css({
              //   display: "block",
              // });
              $(".pkt-calc__products .swiper-wrapper").html(result.data);

              swiperprod = new Swiper(".pkt-calc__products .swiper-container", {
                loop: false,
                slidesPerView: "auto",
                lazy: { loadPrevNext: true },
                navigation: {
                  nextEl: ".pkt-calc__products .swiper-button-next",
                  prevEl: ".pkt-calc__products .swiper-button-prev",
                },
                scrollbar: {
                  draggable: true,
                  el: ".pkt-calc__products .swiper-scrollbar",
                },
              });

              // Убираем loader с товаров
              $(".pkt-calc__products img").each(function () {
                var dataSrc = $(this).attr("data-src");
                if (dataSrc) {
                  $(this).attr("src", dataSrc).removeAttr("data-src");
                }
              });
            } else {
              // $(".pkt-calc__products").css({
              //   display: "none",
              // });
              $(".pkt-calc__products .swiper-wrapper").html("Пусто");
              if (swiperprod) {
                swiperprod.destroy(true, true);
              }
            }
          },
        });

        let heigth;
        let width;
        let length;
        let arcLength;
        let result;
        switch (pktmaterials) {
          case "15":
            switch (construction) {
              case "0":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#height").val())
                  ? (exit = 1)
                  : (heigth = $("#height").val());
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                result = zabor(length, heigth);
                for (let value of result) {
                  html +=
                    "<span class='res'> " +
                    value[1] +
                    " лист(а/ов) " +
                    value[0] +
                    " </span>";
                }
                $(".pkt-calc__result").html(html);
                $(".pkt-calc__result").fadeIn();
                break;
              case "1":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#width").val())
                  ? (exit = 1)
                  : (width = $("#width").val());
                if (
                  isEmpty($("#arcLength").val()) &&
                  isEmpty($("#height").val())
                ) {
                  exit = 1;
                } else {
                  arcLength = $("#arcLength").val();
                  heigth = $("#height").val();
                }
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }

                result = archStructure(width, length, heigth, arcLength);

                for (let value of result) {
                  html +=
                    "<span class='res'> " +
                    value[1] +
                    " лист(а/ов) " +
                    value[0] +
                    " </span>";
                }
                $(".pkt-calc__result").html(html);
                break;
              case "2":
                var exitCount = 0;
                var sposob = 0;
                isEmpty($("#length").val())
                  ? /*exit = 1*/ exitCount++
                  : (length = $("#length").val());
                isEmpty($("#height").val())
                  ? /*exit = 1*/ exitCount++
                  : (heigth = $("#height").val());
                isEmpty($("#width").val())
                  ? /*exit = 1*/ exitCount++
                  : (width = $("#width").val());
                if (exitCount > 0) {
                  exitCount = 0;
                  isEmpty($("#skat_1").val())
                    ? exitCount++
                    : (skat1 = $("#skat_1").val());
                  isEmpty($("#skat_2").val())
                    ? exitCount++
                    : (skat2 = $("#skat_2").val());
                  isEmpty($("#width").val())
                    ? exitCount++
                    : (width = $("#width").val());
                  sposob = 1;
                }
                if (exitCount > 0) {
                  alert("Заполните все поля!");
                  return false;
                }
                if (sposob == 0) {
                  result = visor(length, heigth, width);
                } else {
                  length =
                    parseFloat(skat1.replace(/,/, ".")) +
                    parseFloat(skat2.replace(/,/, "."));
                  result = zabor(width, length);
                }
                for (let value of result) {
                  html +=
                    "<span class='res'> " +
                    value[1] +
                    " лист(а/ов) " +
                    value[0] +
                    " </span>";
                }
                $(".pkt-calc__result").html(html);
                break;
              case "3":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#width").val())
                  ? (exit = 1)
                  : (width = $("#width").val());
                //isEmpty($('#height').val()) ? exit = 1  : heigth = $('#height').val();
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                result = zabor(length, width);
                for (let value of result) {
                  html +=
                    "<span class='res'> " +
                    value[1] +
                    " лист(а/ов) " +
                    value[0] +
                    " </span>";
                }
                $(".pkt-calc__result").html(html);
                break;
              case "4":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#arcLength").val())
                  ? (arcLength = null)
                  : (arcLength = $("#arcLength").val());
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }

                result = archStructureVisor(length, arcLength);

                for (let value of result) {
                  html +=
                    "<span class='res'> " +
                    value[1] +
                    " лист(а/ов) " +
                    value[0] +
                    " </span>";
                }
                $(".pkt-calc__result").html(html);
                break;
            }
            break;
          case "16":
            switch (construction) {
              case "0":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#height").val())
                  ? (exit = 1)
                  : (heigth = $("#height").val());
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                result = monolithic(length, heigth);
                html += "<span class='res'> " + result + " лист(а/ов) </span>";

                $(".pkt-calc__result").html(html);
                break;
              case "1":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#width").val())
                  ? (exit = 1)
                  : (width = $("#width").val());

                if (
                  isEmpty($("#arcLength").val()) &&
                  isEmpty($("#height").val())
                ) {
                  exit = 1;
                } else {
                  arcLength = $("#arcLength").val();
                  heigth = $("#height").val();
                }
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                //    function monolithic(length,height,width = null, arcLength = null){

                if (arcLength != null) {
                  result = monolithic(length, arcLength);
                  html +=
                    "<span class='res'> " + result + " лист(а/ов) </span>";
                  $(".pkt-calc__result").html(html);
                  break;
                } else {
                  console.log(width);
                  radius = height / 2 + Math.pow(width, 2) / (8 * height);
                  inclination = Math.floor(
                    2 * radToDeg(Math.asin(width / (2 * radius)))
                  );
                  arcLength = (Math.PI * radius * inclination) / 180;

                  result = monolithic(length, arcLength);
                  console.log(result);
                  html +=
                    "<span class='res'> " + result + " лист(а/ов) </span>";
                  $(".pkt-calc__result").html(html);
                  break;
                }
              case "2":
                var exitCount = 0;
                var sposob = 0;
                isEmpty($("#length").val())
                  ? /*exit = 1*/ exitCount++
                  : (length = $("#length").val());
                isEmpty($("#height").val())
                  ? /*exit = 1*/ exitCount++
                  : (heigth = $("#height").val());
                isEmpty($("#width").val())
                  ? /*exit = 1*/ exitCount++
                  : (width = $("#width").val());
                if (exitCount > 0) {
                  exitCount = 0;
                  isEmpty($("#skat_1").val())
                    ? exitCount++
                    : (skat1 = $("#skat_1").val());
                  isEmpty($("#skat_2").val())
                    ? exitCount++
                    : (skat2 = $("#skat_2").val());
                  isEmpty($("#width").val())
                    ? exitCount++
                    : (width = $("#width").val());
                  sposob = 1;
                }
                if (exitCount > 0) {
                  alert("Заполните все поля!");
                  return false;
                }
                if (sposob == 0) {
                  slope = Math.sqrt(
                    Math.pow(parseFloat(width) / 2, 2) +
                      Math.pow(parseFloat(heigth), 2)
                  ).toFixed(2); //длина склона
                  result = monolithic(length, slope);
                } else {
                  width =
                    parseFloat(skat1.replace(/,/, ".")) +
                    parseFloat(skat2.replace(/,/, "."));
                  result = monolithic(length, width);
                }

                /* isEmpty($('#length').val()) ? exit = 1 : length = $('#length').val();
                                      isEmpty($('#height').val()) ? exit = 1  : heigth = $('#height').val();
                                      isEmpty($('#width').val()) ? exit = 1 : width = $('#width').val();
                                      if (exit){
                                          alert("Заполните все поля!")
                                          return false;
                                      }
                                      slope = Math.sqrt(Math.pow(width/2,2)+Math.pow(height,2)).toFixed(2); //длина склона
                                      result = monolithic(length, slope);*/

                html += "<span class='res'> " + result + " лист(а/ов) </span>";
                $(".pkt-calc__result").html(html);
                break;
              case "3":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#width").val())
                  ? (exit = 1)
                  : (width = $("#width").val());
                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                result = monolithic(length, width);
                html += "<span class='res'> " + result + " лист(а/ов) </span>";

                $(".pkt-calc__result").html(html);
                break;
              case "4":
                isEmpty($("#length").val())
                  ? (exit = 1)
                  : (length = $("#length").val());
                isEmpty($("#arcLength").val())
                  ? (exit = 1)
                  : (heigth = $("#arcLength").val());

                if (exit) {
                  alert("Заполните все поля!");
                  return false;
                }
                result = monolithic(length, heigth);
                html += "<span class='res'> " + result + " лист(а/ов) </span>";

                $(".pkt-calc__result").html(html);
                break;
            }
            break;
          case "2":
            break;
          default:
            alert("Ошибка");
        }
      });

      function isEmpty(str) {
        if (str.trim() == "") return true;
        return false;
      }
    })();
  }

  Array.prototype.nearest = function (i) {
    return this.filter((x) => x >= i).sort(
      (x, y) => Math.abs(x - i) - Math.abs(y - i)
    )[0];
  };
  Array.prototype.cutting = function (i) {
    return this.filter((x) => x >= i);
  };

  let sizeLathing = {
    2500: 4,
    5625: 6,
    9025: 8,
    11025: 10,
    20000: 16,
  };

  function lathing(length, height) {
    let area = length * height;
    let keys = Object.keys(sizeLathing);
    let size = keys.nearest(area);

    return {
      value: sizeLathing[size] + " мм",
      area: sizeLathing[size],
    };
  }

  const STR = "2100x";
  const sizeHeight = [12000, 9000, 6000, 3000];

  function zabor(length, height) {
    let obrez = new Map();
    let arr = new Map();
    let countList = Math.ceil(length / 2.1); // количество листов
    height = height * 1000; // метры в мм
    if (sizeHeight.indexOf(height) != -1) {
      // если высота совпадает с размером
      return arr.set(STR + height, countList);
    }
    let sizes = sizeHeight.cutting(height);
    let totalHeight = height * countList;
    sizes.forEach(function (sizeBlock) {
      let arr = new Map(); // мапа
      let countSizeBlock = Math.floor(sizeBlock / height); // кол-во обрезанных блоков
      if (countSizeBlock === 1) {
        let totalnoobrez = countList * sizeBlock;
        let cutting = totalnoobrez - totalHeight;
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr.set(STR + sizeBlock, countList));
      } else {
        let totalblocks;
        let remainder;
        let cutting;
        if (countList < countSizeBlock) {
          totalblocks = 1;
          arr.set(STR + sizeBlock, totalblocks); // запись
          cutting = (sizeBlock - countList * height) * totalblocks; // сколько мат. обрезано
          remainder = 0;
        } else {
          totalblocks = Math.floor(countList / countSizeBlock); //кол-во блоков цельных
          let blocks = totalblocks * countSizeBlock;
          if (countList > blocks) {
            let nado = countList - blocks;
            let sizeBlock2 = sizeHeight.nearest(nado * height);
            if (sizeBlock2 === sizeBlock) {
              totalblocks++;
            }
          }
          arr.set(STR + sizeBlock, totalblocks); // запись
          blocks = totalblocks * countSizeBlock;
          let unused = 0;
          if (countList < blocks) {
            unused = blocks - countList;
          }
          cutting = (sizeBlock - countSizeBlock * height) * totalblocks; // сколько мат. обрезано
          cutting = cutting + unused * height;
          remainder = countList - countSizeBlock * totalblocks;
        }
        if (remainder > 0) {
          // смотрим остаток
          sizeBlock = sizeHeight.nearest(remainder * height); // ищем подходящий размер
          let blocks = Math.floor(sizeBlock / height); // сколько блоков получим после обреза
          if (blocks === 1) {
            arr.set(STR + sizeBlock, remainder);
            cutting = cutting + (sizeBlock - height) * remainder;
          } else {
            if (remainder < blocks) {
              totalblocks = 1;
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            } else {
              totalblocks = Math.floor(remainder / blocks);
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            }
          }
        }
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr);
      }
    });
    let keys = new Array();
    for (let key of obrez.keys()) {
      keys.push(key);
    }
    let mizObrez = Math.min.apply(null, keys);

    return obrez.get(mizObrez);
  }

  //console.log(zabor(8,1.5))

  function archStructure(width, length, height = null, arcLength = null) {
    let obrez = new Map();
    let arr = new Map();
    let countList = Math.ceil(length / 2.1); // количество листов

    if (arcLength != null && arcLength != "") {
      arcLength = parseFloat(arcLength.replace(/,/, ".")) * 1000;
      height = arcLength;
      if (sizeHeight.indexOf(height) != -1) {
        // если высота совпадает с размером
        return arr.set(STR + height, countList);
      }
      let sizes = sizeHeight.cutting(height);
      let totalHeight = height * countList;
      sizes.forEach(function (sizeBlock) {
        let arr = new Map(); // мапа
        let countSizeBlock = Math.floor(sizeBlock / height); // кол-во обрезанных блоков
        if (countSizeBlock === 1) {
          let totalnoobrez = countList * sizeBlock;
          let cutting = totalnoobrez - totalHeight;
          for (let key of obrez.keys()) {
            if (cutting === key) {
              cutting = cutting + 1;
            }
          }
          obrez.set(cutting, arr.set(STR + sizeBlock, countList));
        } else {
          let totalblocks;
          let cutting;
          let remainder;
          if (countList < countSizeBlock) {
            totalblocks = 1;
            arr.set(STR + sizeBlock, totalblocks); // запись
            cutting = (sizeBlock - countList * height) * totalblocks; // сколько мат. обрезано
            remainder = 0;
          } else {
            totalblocks = Math.floor(countList / countSizeBlock); //кол-во блоков цельных
            let blocks = totalblocks * countSizeBlock;
            if (countList > blocks) {
              let nado = countList - blocks;
              let sizeBlock2 = sizeHeight.nearest(nado * height);
              if (sizeBlock2 === sizeBlock) {
                totalblocks++;
              }
            }
            arr.set(STR + sizeBlock, totalblocks); // запись
            blocks = totalblocks * countSizeBlock;
            let unused = 0;
            if (countList < blocks) {
              unused = blocks - countList;
            }
            cutting = (sizeBlock - countSizeBlock * height) * totalblocks; // сколько мат. обрезано
            cutting = cutting + unused * height;
            remainder = countList - countSizeBlock * totalblocks;
          }
          if (remainder > 0) {
            // смотрим остаток
            sizeBlock = sizeHeight.nearest(remainder * height); // ищем подходящий размер
            let blocks = Math.floor(sizeBlock / height); // сколько блоков получим после обреза
            if (blocks === 1) {
              arr.set(STR + sizeBlock, remainder);
              cutting = cutting + (sizeBlock - height) * remainder;
            } else {
              if (remainder < blocks) {
                totalblocks = 1;
                arr.set(STR + sizeBlock, totalblocks);
                cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
              } else {
                totalblocks = Math.floor(remainder / blocks);
                arr.set(STR + sizeBlock, totalblocks);
                cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
              }
            }
          }
          for (let key of obrez.keys()) {
            if (cutting === key) {
              cutting = cutting + 1;
            }
          }
          obrez.set(cutting, arr);
        }
      });
      let keys = new Array();
      for (let key of obrez.keys()) {
        keys.push(key);
      }
      let mizObrez = Math.min.apply(null, keys);

      return obrez.get(mizObrez);
    } else {
      height = parseFloat(height.replace(/,/, "."));
      let radius = height / 2 + Math.pow(width, 2) / (8 * height);
      let inclination = 2 * radToDeg(Math.asin(width / (2 * radius)));
      arcLength = (Math.PI * radius * inclination) / 180;
      arcLength = arcLength * 1000;
      height = arcLength;

      if (sizeHeight.indexOf(height) != -1) {
        // если высота совпадает с размером
        return arr.set(STR + height, countList);
      }
      let sizes = sizeHeight.cutting(height);
      let totalHeight = height * countList;
      sizes.forEach(function (sizeBlock) {
        let arr = new Map(); // мапа
        let countSizeBlock = Math.floor(sizeBlock / height); // кол-во обрезанных блоков
        if (countSizeBlock === 1) {
          let totalnoobrez = countList * sizeBlock;
          let cutting = totalnoobrez - totalHeight;
          for (let key of obrez.keys()) {
            if (cutting === key) {
              cutting = cutting + 1;
            }
          }
          obrez.set(cutting, arr.set(STR + sizeBlock, countList));
        } else {
          let totalblocks;
          let cutting;
          let remainder;
          if (countList < countSizeBlock) {
            totalblocks = 1;
            arr.set(STR + sizeBlock, totalblocks); // запись
            cutting = (sizeBlock - countList * height) * totalblocks; // сколько мат. обрезано
            remainder = 0;
          } else {
            totalblocks = Math.floor(countList / countSizeBlock); //кол-во блоков цельных
            let blocks = totalblocks * countSizeBlock;
            if (countList > blocks) {
              let nado = countList - blocks;
              let sizeBlock2 = sizeHeight.nearest(nado * height);
              if (sizeBlock2 === sizeBlock) {
                totalblocks++;
              }
            }
            arr.set(STR + sizeBlock, totalblocks); // запись
            blocks = totalblocks * countSizeBlock;
            let unused = 0;
            if (countList < blocks) {
              unused = blocks - countList;
            }
            cutting = (sizeBlock - countSizeBlock * height) * totalblocks; // сколько мат. обрезано
            cutting = cutting + unused * height;
            remainder = countList - countSizeBlock * totalblocks;
          }
          if (remainder > 0) {
            // смотрим остаток
            sizeBlock = sizeHeight.nearest(remainder * height); // ищем подходящий размер
            let blocks = Math.floor(sizeBlock / height); // сколько блоков получим после обреза
            if (blocks === 1) {
              arr.set(STR + sizeBlock, remainder);
              cutting = cutting + (sizeBlock - height) * remainder;
            } else {
              if (remainder < blocks) {
                totalblocks = 1;
                arr.set(STR + sizeBlock, totalblocks);
                cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
              } else {
                totalblocks = Math.floor(remainder / blocks);
                arr.set(STR + sizeBlock, totalblocks);
                cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
              }
            }
          }
          for (let key of obrez.keys()) {
            if (cutting === key) {
              cutting = cutting + 1;
            }
          }
          obrez.set(cutting, arr);
        }
      });
      let keys = new Array();
      for (let key of obrez.keys()) {
        keys.push(key);
      }
      let mizObrez = Math.min.apply(null, keys);

      return obrez.get(mizObrez);
    }
  }

  // console.log(archStructure(3,7,1.5));

  function radToDeg(rad) {
    return (rad * 180) / Math.PI;
  }

  function visor(length, height, width) {
    let obrez = new Map();
    let arr = new Map();
    let countList = Math.ceil(length / 2.1); // количество листов
    let slope = Math.sqrt(Math.pow(width / 2, 2) + Math.pow(height, 2)).toFixed(
      2
    ); //длина склона
    slope = slope * 1000;

    height = slope;

    if (sizeHeight.indexOf(height) != -1) {
      // если высота совпадает с размером
      return arr.set(STR + height, countList);
    }
    let sizes = sizeHeight.cutting(height);
    let totalHeight = height * countList;
    sizes.forEach(function (sizeBlock) {
      let arr = new Map(); // мапа
      let countSizeBlock = Math.floor(sizeBlock / height); // кол-во обрезанных блоков
      if (countSizeBlock === 1) {
        let totalnoobrez = countList * sizeBlock;
        let cutting = totalnoobrez - totalHeight;
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr.set(STR + sizeBlock, countList));
      } else {
        let totalblocks;
        let remainder;
        let cutting;
        if (countList < countSizeBlock) {
          totalblocks = 1;
          arr.set(STR + sizeBlock, totalblocks); // запись
          cutting = (sizeBlock - countList * height) * totalblocks; // сколько мат. обрезано
          remainder = 0;
        } else {
          totalblocks = Math.floor(countList / countSizeBlock); //кол-во блоков цельных
          let blocks = totalblocks * countSizeBlock;
          if (countList > blocks) {
            let nado = countList - blocks;
            let sizeBlock2 = sizeHeight.nearest(nado * height);
            if (sizeBlock2 === sizeBlock) {
              totalblocks++;
            }
          }
          arr.set(STR + sizeBlock, totalblocks); // запись
          blocks = totalblocks * countSizeBlock;
          let unused = 0;
          if (countList < blocks) {
            unused = blocks - countList;
          }
          cutting = (sizeBlock - countSizeBlock * height) * totalblocks; // сколько мат. обрезано
          cutting = cutting + unused * height;
          remainder = countList - countSizeBlock * totalblocks;
        }
        if (remainder > 0) {
          // смотрим остаток
          sizeBlock = sizeHeight.nearest(remainder * height); // ищем подходящий размер
          let blocks = Math.floor(sizeBlock / height); // сколько блоков получим после обреза
          if (blocks === 1) {
            arr.set(STR + sizeBlock, remainder);
            cutting = cutting + (sizeBlock - height) * remainder;
          } else {
            if (remainder < blocks) {
              totalblocks = 1;
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            } else {
              totalblocks = Math.floor(remainder / blocks);
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            }
          }
        }
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr);
      }
    });
    let keys = new Array();
    for (let key of obrez.keys()) {
      keys.push(key);
    }
    let mizObrez = Math.min.apply(null, keys);

    return obrez.get(mizObrez);
  }

  //console.log(visor(8,1.5,3));

  function archStructureVisor(length, arcLength) {
    let obrez = new Map();
    let arr = new Map();

    let countList = Math.ceil(length / 2.1); // количество листов
    arcLength = arcLength * 1000;
    let height = arcLength;

    if (sizeHeight.indexOf(height) != -1) {
      // если высота совпадает с размером
      return arr.set(STR + height, countList);
    }

    let sizes = sizeHeight.cutting(height);
    let totalHeight = height * countList;
    sizes.forEach(function (sizeBlock) {
      let arr = new Map(); // мапа
      let countSizeBlock = Math.floor(sizeBlock / height); // кол-во обрезанных блоков
      if (countSizeBlock === 1) {
        let totalnoobrez = countList * sizeBlock;
        let cutting = totalnoobrez - totalHeight;
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr.set(STR + sizeBlock, countList));
      } else {
        let totalblocks;
        let remainder;
        let cutting;
        let blocks;
        if (countList < countSizeBlock) {
          totalblocks = 1;
          arr.set(STR + sizeBlock, totalblocks); // запись
          cutting = (sizeBlock - countList * height) * totalblocks; // сколько мат. обрезано
          remainder = 0;
        } else {
          totalblocks = Math.floor(countList / countSizeBlock); //кол-во блоков цельных
          blocks = totalblocks * countSizeBlock;
          if (countList > blocks) {
            let nado = countList - blocks;
            let sizeBlock2 = sizeHeight.nearest(nado * height);
            if (sizeBlock2 === sizeBlock) {
              totalblocks++;
            }
          }
          arr.set(STR + sizeBlock, totalblocks); // запись
          blocks = totalblocks * countSizeBlock;
          let unused = 0;
          if (countList < blocks) {
            unused = blocks - countList;
          }
          cutting = (sizeBlock - countSizeBlock * height) * totalblocks; // сколько мат. обрезано
          cutting = cutting + unused * height;
          remainder = countList - countSizeBlock * totalblocks;
        }
        if (remainder > 0) {
          // смотрим остаток
          sizeBlock = sizeHeight.nearest(remainder * height); // ищем подходящий размер
          blocks = Math.floor(sizeBlock / height); // сколько блоков получим после обреза
          if (blocks === 1) {
            arr.set(STR + sizeBlock, remainder);
            cutting = cutting + (sizeBlock - height) * remainder;
          } else {
            if (remainder < blocks) {
              totalblocks = 1;
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            } else {
              totalblocks = Math.floor(remainder / blocks);
              arr.set(STR + sizeBlock, totalblocks);
              cutting = cutting + (sizeBlock - blocks * height) * totalblocks;
            }
          }
        }
        for (let key of obrez.keys()) {
          if (cutting === key) {
            cutting = cutting + 1;
          }
        }
        obrez.set(cutting, arr);
      }
    });
    let keys = new Array();
    for (let key of obrez.keys()) {
      keys.push(key);
    }
    let mizObrez = Math.min.apply(null, keys);
    return obrez.get(mizObrez);
  }

  function monolithic(length, height, width = null, arcLength = null) {
    height = height * 1000;
    length = length * 1000;
    let storonaA = 2050;
    let storonaB = 3050;

    let countList;
    let listHeight;
    let totalHeight;
    let realHeight;

    if (storonaA > height) {
      countList = Math.ceil(length / storonaB);
      listHeight = storonaA;
      totalHeight = countList * listHeight;
      realHeight = countList * height;
      if (totalHeight >= realHeight) return countList;
    } else {
      countList = Math.ceil(length / storonaA);
      listHeight = storonaB;
      totalHeight = countList * listHeight;
      realHeight = countList * height;
      if (totalHeight >= realHeight) return countList;
    }
    if (height > storonaB) {
      countList = Math.ceil(length / storonaA);
      totalHeight = storonaB * countList;
      realHeight = height * countList;
      let nado = realHeight - totalHeight;
      let dopCount = Math.ceil(nado / storonaB);
      return countList + dopCount;
    }
  }

  if (document.querySelector(".pkt-calc")) {
    initPKTCalc();
  }

  /** 
   * Отслеживаем ajax. В товаре кнопка которая подтягивает код калькулятора, нужно будет его проинициализировать после этого
   */
  $(document).ajaxComplete(function (event, xhr, settings) {
    if (settings.url === "/pkt-calc/?fancybox=true") {
      initPKTCalc();
    }
  });
} catch (e) {
  console.error("Ошибка pkt_calc.js", e);
}
