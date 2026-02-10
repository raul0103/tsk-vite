// приходится для поддержки UTF-8 и кириллицы использоывать base64 вариант шрифта, сгенерированный https://rawgit.com/MrRio/jsPDF/master/fontconverter/fontconverter.html
import /* webpackChunkName: "latoRegular" */ latoRegular from "./latoRegular";
import { jsPDF } from "jspdf";
import "jspdf-autotable";

const API_URL = "/korzina/";

console.log("CreatePDF loaded");

document.addEventListener("DOMContentLoaded", async () => {
  const pdfButton = document.querySelectorAll(".js-create-pdf");
  if (!pdfButton.length) return;
  pdfButton.forEach((button) => {
    button.addEventListener("click", async (e) => {
      // console.log("Create pdf clicked");
      e.preventDefault();
      await createPdf();
    });
  });
});

async function createPdf(pdfFileName = "zakaz_skidki-plus.pdf") {
  const cartProducts = await fetchProducts();
  // const { jsPDF } = await import(/* webpackChunkName: "jspdf" */"jspdf");
  // await import(/* webpackChunkName: "jspdf-autotable" */"jspdf-autotable");

  if (!cartProducts) {
    console.log("createPdf aborted: empty cart");
    return;
  }

  const today = new Date();

  const addCustomFont = (doc) => {
    const fontName = "Lato";
    const fontStyle = "normal";
    doc.addFileToVFS("Lato-Regular.ttf", latoRegular);
    doc.addFont("Lato-Regular.ttf", fontName, fontStyle);
    doc.setFont(fontName);
  };

  const doc = new jsPDF({
    orientation: "portrait",
    unit: "mm",
    format: "a4",
  });

  addCustomFont(doc);

  doc.setFontSize(14);

  doc.text(
    `Заказ от ${today.getDate()}/${today.getMonth() + 1}/${today.getFullYear()} ${
      window.location.host
    }`,
    10,
    10
  );
  // {"id":"134135","price":972,"old_price":1049,"weight":0,"count":"1","options":[],"ctx":"rasprodazha","article":"Dyu-134135","name":"Дюбель для теплоизоляции"}
  const tableColumnHeaders = ["#", "Арт.", "Наименование", "Количество", "Стоимость, руб."];
  const tableRows = cartProducts.map((product, index) => [
    index + 1,
    product.article,
    product.name || "-",
    product.count || 0,
    `${(product.price * product.count).toFixed(2) || 0}`,
  ]);

  // Add total
  const totalPrice = cartProducts.reduce((sum, p) => sum + p.price * (p.count || 1), 0);
  tableRows.push(["", "", "Итого:", "", `${totalPrice.toFixed(2)} руб.`]);

  // Add table to PDF
  doc.autoTable({
    head: [tableColumnHeaders],
    body: tableRows,
    startY: 20,
    theme: "grid",
    headStyles: { font: "Lato", fillColor: [100, 100, 100] }, // Blue header
    styles: { halign: "center" },
    bodyStyles: { font: "Lato", overflow: "linebreak" },
  });

  // Trigger download
  doc.save(pdfFileName);
}

async function fetchProducts() {
  try {
    const response = await fetch(API_URL, {
      method: "POST",
      headers: {
        "X-Requested-With": "fetch",
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    if (!data.success || !data.products?.length) {
      throw new Error("Received bad data: ", JSON.stringify(data));
    }
    return data.products;
  } catch (e) {
    console.warn("Error creating PDF: ", e);
    return false;
  }
}
