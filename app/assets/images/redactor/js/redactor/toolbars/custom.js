var RTOOLBAR = {
  html: { name: 'html', title: RLANG.html, func: 'toggle' },  
  separator10: { name: 'separator' },
  styles: 
  {
    name: 'styles', title: RLANG.styles, func: 'show', 
    dropdown: 
    {
      p:      {exec: 'formatblock', name: '<p>', title: RLANG.paragraph},
      h1:     {exec: 'formatblock', name: '<h1>', title: RLANG.header1, style: 'font-size: 24px;'},
      h2:     {exec: 'formatblock', name: '<h2>', title: RLANG.header2, style: 'font-size: 18px; font-weight: bold;'},
      h3:     {exec: 'formatblock', name: '<h3>', title: "Заголовок 3", style: 'font-size: 14px; font-weight: bold;'},
      h4:     {exec: 'formatblock', name: '<h4>', title: "Заголовок 4", style: 'font-size: 12px; font-weight: bold;'}                                 
    }
  },
  separator9: { name: 'separator' },        
  bold:   {exec: 'Bold', name: 'bold', title: RLANG.bold},        
  italic:   {exec: 'italic', name: 'italic', title: RLANG.italic},
  separator3: { name: 'separator' },      
  ul:    {exec: 'insertunorderedlist', name: 'unorderlist', title: '&bull; ' + RLANG.unorderedlist},
  ol:    {exec: 'insertorderedlist', name: 'orderlist', title: '1. ' + RLANG.orderedlist},
  separator4: { name: 'separator' },       
  image: { name: 'image', title: RLANG.image, func: 'showImage' },
  link: 
  {
    name: 'link', title: RLANG.link, func: 'show',
    dropdown: 
    {
      link:   {name: 'link', title: RLANG.link_insert, func: 'showLink'},
      unlink: {exec: 'unlink', name: 'unlink', title: RLANG.unlink}
    }     
  },
  separator8: { name: 'separator' }
};