---
title: "How to deploy my blog"
date: 2022-10-13T21:03:08-04:00
draft: false
---

# How to deploy a static site using Hugo, S3 and Cloudfront

### **Why deploy this way**

I was looking for a cheap and easy way to deploy a blog. Here is why I chose this style of deployment:

  * I'm garanteed to stay in the free tier for [S3](https://aws.amazon.com/s3/pricing/) and [Cloudfront](https://aws.amazon.com/cloudfront/pricing/)
  * [Hugo](https://gohugo.io/getting-started/quick-start/) is a static site generating framework that is extremely fast and easy to use.

### **Prerequisites**

1. [Install the AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
