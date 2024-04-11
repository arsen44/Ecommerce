import React from "react";
import axios from "axios";

const sitemapXML = (data) => {
  let projectsXML = "";
  data.results.map((post) => {
      const projectURL = `http://127.0.0.1:8000/products/${post.slug}`;

    {
      post.media_type === "image" &&
        (projectsXML += `
      <url>
        <loc>${projectURL}</loc>      
        <priority>0.50</priority>
      </url>`);
    }

    {
      post.media_type === "video" &&
        (projectsXML += `
      <url>
        <loc>${projectURL}</loc>       
          <video:video>
            <video:title>${post.title}</video:title>
            <video:content_loc>${post.media}</video:content_loc>     
          </video:video>
        <priority>0.50</priority>
      </url>`);
    }
  });
  return `<?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">  
      <url>
        <loc>https://www.cakenuage.com/</loc>
        <priority>1.00</priority>
      </url>
      <url>
        <loc>https://www.cakenuage.com/about/</loc>
        <priority>0.80</priority>
      </url>
      ${projectsXML}
    </urlset>`;
};

class Sitemap extends React.Component {
  static async getInitialProps({ res }) {
    const data = await axios
      .get(`${process.env.BASE_FETCH_URL}/api/sitemap/`)
      .then((response) => response.data);
    res.setHeader("Content-Type", "text/xml");
    res.write(sitemapXML(data));
    res.end();
  }
}
export default Sitemap;
