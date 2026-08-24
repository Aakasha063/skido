# Skido - Your workout partner

A polished, minimalist workout tracking web app designed for strength training and progressive overload. Live at [skido.fit](https://skido.fit). 

This app replaces complicated spreadsheets with a premium, focused interface that allows you to log working sets, track personal records, and view progression charts for every exercise.

## Features

- **Workout Logger:** Log your working sets, reps, weight, and RIR (Reps in Reserve).
- **Previous Performance:** See what you did last time and get suggestions based on a double-progression philosophy.
- **Exercise Instructions:** Detailed instructions for every exercise, including setup, execution, and cues.
- **Progress Charts:** Track your strength over time for each exercise, filtering by highest weight, best reps, or total volume.
- **Rest Timer:** Built-in timer tailored to compound or isolation exercises.
- **Body Metrics:** Track bodyweight, height, waist, and other measurements.
- **Authentication:** Secure user accounts backed by Supabase.

## Tech Stack

- **Frontend:** React, Vite, Tailwind CSS, Radix UI
- **Routing:** TanStack Router
- **Backend/Auth:** Supabase
- **Icons:** Lucide React

## Getting Started

Follow these steps to set up the project locally:

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/getfitwithsky.git
cd getfitwithsky
```

### 2. Install dependencies

This project uses npm (or bun/yarn).

```bash
npm install
```

### 3. Set up environment variables

Create a `.env.local` file in the root of the project and add your Supabase credentials:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 4. Run the development server

```bash
npm run dev
```

Open [http://localhost:5173](http://localhost:5173) with your browser to see the result.

## License

This project is licensed under the MIT License - see the LICENSE file for details. Feel free to fork, modify, and use it for your own training!
