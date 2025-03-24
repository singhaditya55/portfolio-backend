-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2025 at 11:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Photography', 'I love capturing beautiful moments with my camera.', '2025-03-08 15:22:58'),
(2, 'Gaming', 'Enjoy playing strategy and open-world games.', '2025-03-08 15:22:58'),
(3, 'Blogging', 'I write about web development and tech trends.', '2025-03-08 15:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `tech_stack` varchar(255) DEFAULT NULL,
  `project_link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `tech_stack`, `project_link`, `image`, `created_at`) VALUES
(1, 'Product Development - Sport Domain', 'Duration: 3 Years | Team Size: 8. Developed and maintained RESTful APIs using Node.js, NestJS, and PHP Laravel, implementing CRUD operations, authentication, and business logic. Worked extensively on PHP CMS and API development using Laravel, ensuring seamless content management and backend functionality. Managed MySQL database, optimizing queries and implementing migrations for structured data management. Led API testing and debugging using Postman, ensuring high reliability and performance. Deployed code via Git and integrated AWS services such as S3, Lambda, SNS, Bedrock, Cognito, and Rekognition for enhanced functionality. Utilized Node.js for AWS Lambda functions, improving backend efficiency and scalability. Worked with NestJS for 1 year, leveraging TypeScript and dependency injection to enhance API modularity and maintainability.', 'Node.js, NestJS, PHP Laravel, MySQL, AWS (S3, Lambda, SNS, Bedrock, Cognito, Rekognition)', 'https://portfolio.example.com', 'uploads/product_dev.png', '2025-03-08 15:22:58'),
(2, 'Face Recognition System - Product', 'Duration: 3 Months | Team Size: 5. Developed GET, POST, and PUT APIs using NestJS Node.js, ensuring efficient backend communication. Collaborated with the frontend team for API integration in Next.js, enabling smooth data flow. Managed MySQL database, handling structured data storage and retrieval. Integrated AWS services, utilizing Cognito for authentication and Rekognition for face recognition. Ensured seamless API performance and security, contributing to a successful project deployment.', 'NestJS, Node.js, MySQL, AWS Cognito, AWS Rekognition, Next.js', 'https://ecommerce.example.com', 'uploads/face_app.jpg', '2025-03-08 15:22:58'),
(3, 'Portfolio Website', 'A fully responsive personal portfolio website showcasing skills and projects, passion', 'React.js, Tailwind CSS, Node.js', 'https://taskmanager.example.com', 'uploads/portfolio_web.jpg', '2025-03-08 15:22:58'),
(4, 'Child Welfare Management App', 'It is basically Cloud based Web Application system will also be developed by which each individual volunteer or members of organization will be able to access this application online and can request for data of activities as per their needs.', 'Java, Firebase, Android SDK', 'https://drive.google.com/file/d/1tKMeXP4BAbcZzrkM4lzFGsb35souAUx8/view', 'uploads/donation_logo.webp', '2025-03-08 15:22:58'),
(5, 'Resume With HTML & CSS', 'a Resume on Web ', 'HTML, CSS, Atom', 'https://drive.google.com/file/d/1_xvNVHx5uAEQEWWajSGo6w6gker8F6iO/view', 'uploads/resume_img.webp', '2025-03-08 15:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `objective` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `experience` longtext DEFAULT NULL,
  `education` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`education`)),
  `certifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`certifications`)),
  `projects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`projects`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `bio`, `profile_image`, `objective`, `skills`, `experience`, `education`, `certifications`, `projects`) VALUES
(1, 'Aditya Singh', 'Backend Developer | Node.js | PHP Laravel | REST API | Nest.js | Manual Tester', 'uploads/aditya.JPG', 'Experienced Backend Developer with 3 years of expertise in Node.js, NestJS, PHP (Laravel) and RESTful API development, proficient in MySQL. Passionate about building scalable, high-performance applications while following best practices. Strong problem-solving skills with a keen interest in learning new technologies and adapting to evolving industry trends. Seeking an opportunity in a growth-driven environment that fosters innovation and continuous learning.', '[\"Node.js\",\"Laravel PHP\",\"Nest.js\",\"MySQL\", \"HTML\",\"CSS\",\"JavaScript\",\"React.js\",\"Manual Testing\"]', '[\n  {\n    \"position\": \"Software Engineer\",\n    \"company\": \"Tech Mahindra\",\n    \"duration\": \"March 2022 - Present\",\n    \"description\": \"Developed scalable applications and optimized frontend UI for better user experience. CMS Development: Developed CRUD operations using PHP Laravel (MVC) with HTML, CSS, JavaScript, Bootstrap, and jQuery. Gained expertise in Laravel’s routes, controllers, models, views, helpers, services, CRON jobs, seeders, and migrations. Managed MySQL database, creating efficient table structures using migrations and optimizing queries for performance. Integrated AWS SNS triggers along with APIs to enhance CRUD functionalities. Deployed projects using Git repositories and implemented AWS App Config for environment variable management. RESTful API Development (Node.js, NestJS, PHP Laravel): Designed and developed scalable RESTful APIs using Node.js and NestJS, ensuring modular and high-performance backend systems. Built RESTful APIs in PHP Laravel, employing the hexagonal architecture approach for better code organization and maintainability. Integrated MySQL databases, utilizing migrations, seeders, and optimized queries for efficient performance. Leveraged TypeScript and dependency injection in NestJS to enhance modularity and scalability. Used Postman and Swagger for API testing, debugging, and documentation, ensuring seamless integration with front-end applications. Implemented JWT authentication and authorization to secure API endpoints. Applied asynchronous programming in Node.js for high-efficiency API execution. Testing: Performed manual testing across iOS/Android, including test case creation, regression, and bug tracking using JIRA and GitHub. Collaborated with developers to prioritize and resolve defects, ensuring high-quality deliverables.\"\n  }\n]\n', '[{\"degree\": \"B.E in Computer Engineering\", \"institution\": \"Mumbai University\", \"year\": \"2018 - 2021\"}]', '[\"AWS Cloud Practitioner\", \"HTML & CSS - Certification Course\", \"Complete Responsive Web Development 4 courses in 1\", \"Software Testing Masterclass (2024)\"]', '[\n  {\n    \"title\": \"Product Development - Sport Domain\",\n    \"technologies\": \"Node.js, NestJS, PHP Laravel, MySQL, AWS (S3, Lambda, SNS, Bedrock, Cognito, Rekognition)\",\n    \"description\": \"Duration: 3 Years | Team Size: 8. Developed and maintained RESTful APIs using Node.js, NestJS, and PHP Laravel, implementing CRUD operations, authentication, and business logic. Worked extensively on PHP CMS and API development using Laravel, ensuring seamless content management and backend functionality. Managed MySQL database, optimizing queries and implementing migrations for structured data management. Led API testing and debugging using Postman, ensuring high reliability and performance. Deployed code via Git and integrated AWS services such as S3, Lambda, SNS, Bedrock, Cognito, and Rekognition for enhanced functionality. Utilized Node.js for AWS Lambda functions, improving backend efficiency and scalability. Worked with NestJS for 1 year, leveraging TypeScript and dependency injection to enhance API modularity and maintainability.\"\n  },\n  {\n    \"title\": \"Rajasthan Royals/BCCI/Product Website & App Testing\",\n    \"technologies\": \"Manual Testing, Postman, Chrome, Firefox, Edge, Safari, Opera, Windows, macOS, iOS, Android\",\n    \"description\": \"Duration: 1 Year | Team Size: 8. Conducted manual testing, including functional, regression, smoke, and sanity testing, ensuring a seamless user experience. Performed cross-browser testing on Chrome, Firefox, Edge, Safari, and Opera for compatibility. Executed cross-platform testing on Windows, macOS, iOS, and Android to validate responsiveness. Carried out API testing with Postman, verifying request-response integrity, authentication, and error handling. Collaborated with developers to identify, track, and resolve defects, improving overall product quality.\"\n  },\n  {\n    \"title\": \"Face Recognition System - Product\",\n    \"technologies\": \"NestJS, Node.js, MySQL, AWS Cognito, AWS Rekognition, Next.js\",\n    \"description\": \"Duration: 3 Months | Team Size: 5. Developed GET, POST, and PUT APIs using NestJS Node.js, ensuring efficient backend communication. Collaborated with the frontend team for API integration in Next.js, enabling smooth data flow. Managed MySQL database, handling structured data storage and retrieval. Integrated AWS services, utilizing Cognito for authentication and Rekognition for face recognition. Ensured seamless API performance and security, contributing to a successful project deployment.\"\n  },\n{\n    \"title\": \"Portfolio Website\",\n    \"technologies\": \"React.js, Tailwind CSS, Node.js\",\n    \"description\": \"A fully responsive personal portfolio website showcasing skills and projects, passion\"\n  }\n]\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
