-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 11:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloud_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloud_data`
--

CREATE TABLE `cloud_data` (
  `IP_Address` longtext DEFAULT NULL,
  `Common_Name` longtext DEFAULT NULL,
  `Organization` longtext DEFAULT NULL,
  `Country` longtext DEFAULT NULL,
  `Locality` longtext DEFAULT NULL,
  `Province` longtext DEFAULT NULL,
  `Subject_Alternative_DNS_Name` longtext DEFAULT NULL,
  `Subject_Alternative_IP_address` longtext DEFAULT NULL,
  `Self-signed` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
INSERT INTO cloud_data VALUES ("IP Address","Common Name","Organization","Country","Locality","Province","Subject Alternative DNS Name","Subject Alternative IP address","Self-signed");
INSERT INTO cloud_data VALUES ("IP Address","Common Name","Organization","Country","Locality","Province","Subject Alternative DNS Name","Subject Alternative IP address","Self-signed");
INSERT INTO cloud_data VALUES ("35.239.253.116","www.example.com","Bitnami",NULL,NULL,NULL,NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.253.128","34.72.84.161",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.72.84.161|10.104.160.1|130.211.228.31|35.239.253.128|35.224.170.91|10.128.0.14","false");
INSERT INTO cloud_data VALUES ("35.239.253.150","35.239.253.150",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.150|34.118.224.1|34.171.165.104|34.171.45.171|34.72.187.195|10.128.0.13","false");
INSERT INTO cloud_data VALUES ("35.239.253.155","*.unity.com","Unity Technologies ApS","DK","København",NULL,"*.unity.com|unity.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.253.157","34.72.156.234",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.72.156.234|10.105.0.1|35.224.114.68|35.239.253.157|35.202.157.229|172.16.0.34","false");
INSERT INTO cloud_data VALUES ("35.239.253.173","US|Temporary Certificate",NULL,NULL,NULL,NULL,NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.253.176","*.simplegmailnotes.com",NULL,NULL,NULL,NULL,"*.lazycrm.com|*.mobilecrm.io|*.simplegmailnotes.com|lazycrm.com|mobilecrm.io",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.253.182","35.227.157.105","Google","US","Sunnyvale","CA",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.253.200","35.239.253.200",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.200|10.28.0.1|35.202.159.93|10.128.0.6","false");
INSERT INTO cloud_data VALUES ("35.239.253.203","hkboxsd.com",NULL,NULL,NULL,NULL,"hkboxsd.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.253.205","34.66.198.36",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.66.198.36|10.192.88.1|35.225.49.172|35.239.253.205|104.198.47.95","false");
INSERT INTO cloud_data VALUES ("35.239.253.208","35.239.253.208",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.208|10.12.0.1|35.224.247.210|10.128.15.193","false");
INSERT INTO cloud_data VALUES ("35.239.253.209","34.67.32.121",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.67.32.121|10.94.0.1|35.239.253.209|10.128.15.214","false");
INSERT INTO cloud_data VALUES ("35.239.253.215","neo-docusign-connect.qburst.in",NULL,NULL,NULL,NULL,"neo-docusign-connect.qburst.in",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.253.219","35.239.253.219",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.219|10.11.240.1","false");
INSERT INTO cloud_data VALUES ("35.239.253.222","Kubernetes Ingress Controller Fake Certificate","Acme Co",NULL,NULL,NULL,"ingress.local",NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.253.226","35.238.29.224",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.238.29.224|10.163.0.1|35.239.253.226|34.134.183.141|34.122.184.220","false");
INSERT INTO cloud_data VALUES ("35.239.253.234","35.239.253.234",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.234|10.3.240.1|35.184.36.1|10.128.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.253.240","35.239.253.240",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.253.240|10.0.0.1|10.11.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.253.246","34.69.172.242",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.69.172.242|10.48.96.1|34.133.111.42|35.193.132.60|35.239.253.246|172.24.50.18","false");
INSERT INTO cloud_data VALUES ("35.239.253.248","CloudFlare Origin Certificate","CloudFlare, Inc.",NULL,NULL,NULL,"*.fascin8app.com|fascin8app.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.253.255","35.224.51.117",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.224.51.117|100.70.10.1|35.238.227.44|35.225.23.238|35.239.253.255|192.168.118.146","false");
INSERT INTO cloud_data VALUES ("35.239.254.13","35.239.254.13",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.13|10.71.192.1|34.27.53.175|35.226.234.77|35.202.53.94|10.71.184.2","false");
INSERT INTO cloud_data VALUES ("35.239.254.15","*.saje.ai",NULL,NULL,NULL,NULL,"*.saje.ai|saje.ai",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.17","35.239.254.17",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.17|10.11.240.1","false");
INSERT INTO cloud_data VALUES ("35.239.254.19","34.121.208.9",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.121.208.9|10.116.0.1|35.239.254.19|35.222.90.29|34.134.143.251|10.128.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.254.33","openlitespeed-wordpress-v12","LiteSpeedCommunity","US","Virtual","New Jersey",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.254.41","34.133.79.186",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.133.79.186|10.122.32.1|35.239.254.41|34.121.81.170|34.16.91.85|10.122.28.2","false");
INSERT INTO cloud_data VALUES ("35.239.254.60","35.239.254.60",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.60|10.92.0.1|34.71.76.163|34.136.198.9|34.122.253.68|10.128.0.34","false");
INSERT INTO cloud_data VALUES ("35.239.254.66","35.239.254.66",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.66|10.110.43.145|34.133.181.214|34.122.69.89|34.135.85.180","false");
INSERT INTO cloud_data VALUES ("35.239.254.46","*.wpengine.com",NULL,NULL,NULL,NULL,"*.wpengine.com|wpengine.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.69","bbqsoldier.com",NULL,NULL,NULL,NULL,"bbqsoldier.com|www.bbqsoldier.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.73","34.67.2.231",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.67.2.231|10.116.0.1|35.239.254.73|34.28.68.114|35.238.178.158|10.48.152.4","false");
INSERT INTO cloud_data VALUES ("35.239.254.74","35.239.254.74",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.74|10.48.0.1|34.136.70.5|34.72.210.214|34.123.0.40","false");
INSERT INTO cloud_data VALUES ("35.239.254.92","Kubernetes Ingress Controller Fake Certificate","Acme Co",NULL,NULL,NULL,"ingress.local",NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.254.101","34.136.181.138",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.136.181.138|10.76.0.1|35.239.254.101|34.69.136.57|35.222.142.234","false");
INSERT INTO cloud_data VALUES ("35.239.254.102","faxnow.app",NULL,NULL,NULL,NULL,"admin.faxnow.app|faxnow.app",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.86","*.wpengine.com",NULL,NULL,NULL,NULL,"*.wpengine.com|wpengine.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.112","35.227.157.105","Google","US","Sunnyvale","CA",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.254.117","clip.midjourney.com",NULL,NULL,NULL,NULL,"clip.midjourney.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.116","35.202.101.247",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.202.101.247|10.171.186.33|35.232.213.37|35.184.16.81|35.239.254.116","false");
INSERT INTO cloud_data VALUES ("35.239.254.123","35.239.254.123",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.123|10.96.0.1|34.71.131.209|35.222.111.248|104.197.136.233|192.168.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.254.126","35.239.254.126",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.126|10.28.0.1|104.198.188.24|35.225.52.68|34.134.87.250|192.168.240.2","false");
INSERT INTO cloud_data VALUES ("35.239.254.137","*.wpengine.com",NULL,NULL,NULL,NULL,"*.wpengine.com|wpengine.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.156","34.132.102.1",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.132.102.1|10.16.80.1|34.123.179.187|34.133.211.75|35.239.254.156|10.128.0.62","false");
INSERT INTO cloud_data VALUES ("35.239.254.176","*.jupyter-prod.firecloud.org","Broad Institute","US","Cambridge","Massachusetts",NULL,NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.188","35.239.254.188",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.188|10.74.0.1|34.122.60.12|199.223.234.204|34.29.77.132|192.168.81.178","false");
INSERT INTO cloud_data VALUES ("35.239.254.195","borekdia.hopto.org",NULL,NULL,NULL,NULL,"borekdia.hopto.org",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.196","*.shopifynetwork.com",NULL,NULL,NULL,NULL,"*.shopifynetwork.com|shopifynetwork.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.199","34.134.86.67",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.134.86.67|10.76.0.1|35.222.29.34|35.226.198.76|35.239.254.199|10.128.0.59","false");
INSERT INTO cloud_data VALUES ("35.239.254.203","34.121.124.7",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.121.124.7|10.57.178.129|34.121.133.176|35.239.254.203|34.122.148.7","false");
INSERT INTO cloud_data VALUES ("35.239.254.205","35.239.254.205",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.205|10.70.0.1|130.211.119.109|34.173.150.219|34.135.224.56|192.168.17.114","false");
INSERT INTO cloud_data VALUES ("35.239.254.233","34.72.146.32",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.72.146.32|10.30.0.1|35.239.254.233|34.122.27.126|35.225.18.13","false");
INSERT INTO cloud_data VALUES ("35.239.254.234","35.239.254.234",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.254.234|10.53.128.1|104.154.28.132|107.178.221.110|35.222.60.223|172.19.0.130","false");
INSERT INTO cloud_data VALUES ("35.239.254.238","legacy-customer.teliax.com",NULL,NULL,NULL,NULL,"legacy-customer.teliax.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.254.242","104.155.182.185",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","104.155.182.185|10.16.0.1|35.239.254.242|10.128.0.61","false");
INSERT INTO cloud_data VALUES ("35.239.254.252","*.nl-sandbox.zpc-sandbox.zebra.com",NULL,NULL,NULL,NULL,"*.nl-sandbox.zpc-sandbox.zebra.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.13","*.cluster-vcac3v2cenbzitenaw4ucwg26u.cloudworkstations.dev",NULL,NULL,NULL,NULL,"*.cluster-vcac3v2cenbzitenaw4ucwg26u.cloudworkstations.dev",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.20","34.69.200.143",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.69.200.143|10.40.0.1|35.239.255.20|10.128.0.4","false");
INSERT INTO cloud_data VALUES ("35.239.255.31","35.225.23.213",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.225.23.213|10.43.0.1|35.239.255.31|10.128.0.62","false");
INSERT INTO cloud_data VALUES ("35.239.255.39","104.197.127.130",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","104.197.127.130|10.0.16.1|34.70.65.13|35.239.255.39|34.121.228.7","false");
INSERT INTO cloud_data VALUES ("35.239.255.49","35.239.255.49",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.49|10.3.240.1|34.132.20.104|34.122.27.11|34.134.66.46","false");
INSERT INTO cloud_data VALUES ("35.239.255.58","aichat.nogamelabs.com",NULL,NULL,NULL,NULL,"aichat.nogamelabs.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.61","35.227.157.105","Google","US","Sunnyvale","CA",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.255.69","35.188.200.11",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.188.200.11|10.8.128.1|35.239.255.69|35.224.138.156|34.68.118.160","false");
INSERT INTO cloud_data VALUES ("35.239.255.88","35.225.129.28",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.225.129.28|10.19.240.1|35.223.179.183|35.239.255.88|35.226.41.199","false");
INSERT INTO cloud_data VALUES ("35.239.255.107","35.239.255.107",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.107|10.15.240.1|34.136.24.89|10.128.0.13","false");
INSERT INTO cloud_data VALUES ("35.239.255.118","35.227.157.105","Google","US","Sunnyvale","CA",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.255.121","35.224.170.90",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.224.170.90|10.8.16.1|35.239.255.121|10.128.0.22","false");
INSERT INTO cloud_data VALUES ("35.239.255.124","35.239.255.124",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.124|10.20.0.1|34.29.17.77|10.128.0.44","false");
INSERT INTO cloud_data VALUES ("35.239.255.131","35.239.4.237",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.4.237|10.90.144.1|34.135.53.235|35.239.255.131|34.173.36.145|192.168.33.146","false");
INSERT INTO cloud_data VALUES ("35.239.255.133","35.227.157.105","Google","US","Sunnyvale","CA",NULL,NULL,"true");
INSERT INTO cloud_data VALUES ("35.239.255.153","35.193.11.239",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.193.11.239|10.75.240.1|146.148.61.44|35.239.255.153|35.184.99.199","false");
INSERT INTO cloud_data VALUES ("35.239.255.174","*.invirtu.io",NULL,NULL,NULL,NULL,"*.invirtu.io|invirtu.io",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.181","35.239.255.181",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.181|10.37.0.1|34.121.144.68|35.222.104.228|34.133.106.214|10.35.248.2","false");
INSERT INTO cloud_data VALUES ("35.239.255.183","35.239.255.183",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.183|10.52.80.1|35.225.37.156|35.202.237.212|34.172.209.202|192.168.42.98","false");
INSERT INTO cloud_data VALUES ("35.239.255.190","35.225.12.243",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.225.12.243|10.39.240.1|35.239.255.190|34.136.184.177|34.135.170.79","false");
INSERT INTO cloud_data VALUES ("35.239.255.196","cleannesy.com",NULL,NULL,NULL,NULL,"cleannesy.com|www.cleannesy.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.205","mcant048.ddns.net",NULL,NULL,NULL,NULL,"mcant048.ddns.net",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.213","34.173.32.145",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.173.32.145|10.47.208.1|34.68.39.204|34.122.35.23|35.239.255.213|192.168.154.226","false");
INSERT INTO cloud_data VALUES ("35.239.255.221","35.239.255.221",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.221|10.11.240.1","false");
INSERT INTO cloud_data VALUES ("35.239.255.220","oculus2404-us1.dropcam.com","Dropcam","US",NULL,NULL,"oculus2404-us1.dropcam.com|nexus-us1.dropcam.com|nexus.dropcam.com",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.225","35.239.255.225",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.225|10.32.0.1|34.172.20.62|34.132.89.206|34.171.170.20|10.128.0.41","false");
INSERT INTO cloud_data VALUES ("35.239.255.231","35.222.232.156",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.222.232.156|10.109.0.1|34.122.22.241|35.239.255.231|34.68.219.83|10.20.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.255.235","35.239.255.235",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.235|10.77.80.1|34.172.80.161|34.121.64.9|34.30.93.162|192.168.199.114","false");
INSERT INTO cloud_data VALUES ("35.239.255.239","35.239.255.239",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.239|10.12.0.1|104.197.91.6|34.121.141.38|35.238.86.116|10.14.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.255.240","35.239.255.240",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","35.239.255.240|10.62.0.1|34.134.181.128|35.202.138.146|34.122.184.155|10.128.0.2","false");
INSERT INTO cloud_data VALUES ("35.239.255.246","api.muvapp.co",NULL,NULL,NULL,NULL,"api.muvapp.co",NULL,"false");
INSERT INTO cloud_data VALUES ("35.239.255.255","34.72.185.21",NULL,NULL,NULL,NULL,"kubernetes|kubernetes.default|kubernetes.default.svc|kubernetes.default.svc.cluster.local","34.72.185.21|10.7.240.1|35.239.255.255|10.128.0.2","false");
