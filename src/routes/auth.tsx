import { createFileRoute, useRouter } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/lib/auth";
import { Icon } from "@/components/sk/ui";

export const Route = createFileRoute("/auth")({
  validateSearch: (search: Record<string, unknown>): { mode?: "signup" } =>
    search["mode"] === "signup" ? { mode: "signup" } : {},
  head: () => ({
    meta: [
      { title: "Sign in — Skido" },
      {
        name: "description",
        content: "Sign in to Skido to run your workouts, log sets and track progress.",
      },
      { property: "og:title", content: "Sign in — Skido" },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: AuthPage,
});

type Mode =
  "signin" | "signup" | "forgot_password" | "verify_otp" | "verify_signup_otp" | "update_password";

function AuthPage() {
  const router = useRouter();
  const { session, loading } = useAuth();
  const search = Route.useSearch();
  const [mode, setMode] = useState<Mode>(search.mode === "signup" ? "signup" : "signin");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [name, setName] = useState("");
  const [otpCode, setOtpCode] = useState("");
  const [showPw, setShowPw] = useState(false);
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    // Only redirect home when we're not in the middle of setting a new password.
    if (!loading && session && mode !== "update_password") router.navigate({ to: "/" });
  }, [loading, session, router, mode]);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    setBusy(true);
    const cleanEmail = email.trim().toLowerCase();
    const cleanOtp = otpCode.trim();
    try {
      if (mode === "signup") {
        const { error } = await supabase.auth.signUp({
          email: cleanEmail,
          password,
          options: { data: { name: name.trim() } },
        });
        if (error) throw error;
        toast.success("Verification code sent to your email.");
        setMode("verify_signup_otp");
      } else if (mode === "verify_signup_otp") {
        const { error } = await supabase.auth.verifyOtp({
          email: cleanEmail,
          token: cleanOtp,
          type: "signup",
        });
        if (error) throw error;
        toast.success("Account verified. Welcome!");
      } else if (mode === "forgot_password") {
        const { error } = await supabase.auth.resetPasswordForEmail(cleanEmail);
        if (error) throw error;
        toast.success("Recovery code sent to your email.");
        setMode("verify_otp");
      } else if (mode === "verify_otp") {
        const { error } = await supabase.auth.verifyOtp({
          email: cleanEmail,
          token: cleanOtp,
          type: "recovery",
        });
        if (error) throw error;
        toast.success("Code verified. Please set a new password.");
        setMode("update_password");
        setPassword("");
      } else if (mode === "update_password") {
        const { error } = await supabase.auth.updateUser({ password });
        if (error) throw error;
        toast.success("Password updated successfully.");
        router.navigate({ to: "/" });
      } else {
        const { error } = await supabase.auth.signInWithPassword({ email: cleanEmail, password });
        if (error) throw error;
      }
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Something went wrong");
    } finally {
      setBusy(false);
    }
  }

  async function google() {
    setBusy(true);
    const { error } = await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin },
    });
    if (error) {
      toast.error(error.message ?? "Google sign-in failed");
      setBusy(false);
    }
  }

  const copy: Record<Mode, { title: string; sub: string; submit: string }> = {
    signin: { title: "Welcome back", sub: "Sign in to continue your plan.", submit: "Sign in" },
    signup: {
      title: "Create your account",
      sub: "Your plan is ready in under a minute.",
      submit: "Create account",
    },
    verify_signup_otp: {
      title: "Check your email",
      sub: `Enter the code we sent to ${email.trim() || "your email"}.`,
      submit: "Verify and continue",
    },
    forgot_password: {
      title: "Reset your password",
      sub: "We'll email you a recovery code.",
      submit: "Send recovery code",
    },
    verify_otp: {
      title: "Enter your code",
      sub: `We sent a recovery code to ${email.trim() || "your email"}.`,
      submit: "Verify code",
    },
    update_password: {
      title: "Set a new password",
      sub: "Use at least 6 characters.",
      submit: "Update password",
    },
  };
  const c = copy[mode];
  const isOtp = mode === "verify_otp" || mode === "verify_signup_otp";
  const showPassword = mode === "signin" || mode === "signup" || mode === "update_password";
  const primary = mode === "signin" || mode === "signup";

  return (
    <div
      style={{
        position: "relative",
        minHeight: "100dvh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        padding: "56px 24px",
      }}
    >
      <div
        aria-hidden="true"
        style={{
          position: "absolute",
          left: "50%",
          top: 0,
          width: 640,
          height: 420,
          marginLeft: -320,
          background: "radial-gradient(ellipse at 50% 0%, rgba(198,244,50,0.16), transparent 70%)",
          pointerEvents: "none",
        }}
      />
      <div style={{ position: "relative", width: "100%", maxWidth: 360 }}>
        <div className="sk-fade" style={{ marginBottom: 40 }}>
          <span
            style={{
              width: 44,
              height: 44,
              borderRadius: 13,
              background: "#1A1A1B",
              border: "1px solid rgba(255,255,255,0.09)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              boxShadow: "inset 0 1px 0 rgba(255,255,255,0.06)",
            }}
          >
            <Icon name="logo" size={20} stroke={1.8} color="#C6F432" />
          </span>
          <h1
            className="sk-lime-text"
            style={{
              margin: "28px 0 0",
              fontSize: 30,
              lineHeight: 1.15,
              fontWeight: 600,
              letterSpacing: "-0.03em",
            }}
          >
            {c.title}
          </h1>
          <p
            style={{
              margin: "8px 0 0",
              fontSize: 15,
              lineHeight: 1.5,
              color: "rgba(255,255,255,0.62)",
            }}
          >
            {c.sub}
          </p>
        </div>

        <form
          onSubmit={submit}
          className="sk-fade"
          style={{ display: "flex", flexDirection: "column", gap: 12, animationDelay: ".06s" }}
        >
          {mode === "signup" && (
            <div className="sk-label">
              <label htmlFor="name" className="sk-cap">
                Name
              </label>
              <input
                id="name"
                className="sk-field"
                autoComplete="name"
                placeholder="Sam Rivera"
                value={name}
                onChange={(e) => setName(e.target.value)}
              />
            </div>
          )}
          {mode !== "update_password" && (
            <div className="sk-label">
              <label htmlFor="email" className="sk-cap">
                Email
              </label>
              <input
                id="email"
                className="sk-field"
                type="email"
                autoComplete="email"
                placeholder="you@example.com"
                required
                disabled={isOtp}
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
          )}
          {isOtp && (
            <div className="sk-label">
              <label htmlFor="otp" className="sk-cap">
                {mode === "verify_signup_otp" ? "Verification code" : "Recovery code"}
              </label>
              <input
                id="otp"
                className="sk-field sk-num"
                inputMode="numeric"
                autoComplete="one-time-code"
                maxLength={8}
                required
                placeholder="12345678"
                value={otpCode}
                onChange={(e) => setOtpCode(e.target.value.replace(/\D/g, ""))}
                style={{ letterSpacing: "0.2em", fontSize: 18 }}
              />
            </div>
          )}
          {showPassword && (
            <div className="sk-label">
              <div
                style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}
              >
                <label htmlFor="password" className="sk-cap">
                  {mode === "update_password" ? "New password" : "Password"}
                </label>
                {mode === "signin" && (
                  <button
                    type="button"
                    className="sk-link-btn"
                    onClick={() => setMode("forgot_password")}
                    style={{ fontSize: 12, color: "rgba(255,255,255,0.62)" }}
                  >
                    Forgot password?
                  </button>
                )}
              </div>
              <div style={{ position: "relative" }}>
                <input
                  id="password"
                  className="sk-field"
                  type={showPw ? "text" : "password"}
                  autoComplete={mode === "signin" ? "current-password" : "new-password"}
                  placeholder="••••••••"
                  required
                  minLength={6}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  style={{ paddingRight: 64 }}
                />
                <button
                  type="button"
                  onClick={() => setShowPw((v) => !v)}
                  aria-label={showPw ? "Hide password" : "Show password"}
                  style={{
                    position: "absolute",
                    right: 6,
                    top: 7,
                    height: 36,
                    padding: "0 12px",
                    borderRadius: 10,
                    border: "none",
                    background: "transparent",
                    color: "rgba(255,255,255,0.62)",
                    fontSize: 12.5,
                    fontWeight: 500,
                    cursor: "pointer",
                  }}
                >
                  {showPw ? "Hide" : "Show"}
                </button>
              </div>
            </div>
          )}
          <button
            type="submit"
            className="sk-btn sk-btn-light"
            disabled={busy}
            style={{ marginTop: 12 }}
          >
            {busy ? "Please wait…" : c.submit}
          </button>
        </form>

        <div className="sk-fade" style={{ animationDelay: ".12s" }}>
          {primary ? (
            <>
              <div
                style={{
                  margin: "20px 0",
                  display: "flex",
                  alignItems: "center",
                  gap: 14,
                  fontSize: 12,
                  color: "rgba(255,255,255,0.5)",
                }}
              >
                <span style={{ height: 1, flex: 1, background: "rgba(255,255,255,0.07)" }} />
                or
                <span style={{ height: 1, flex: 1, background: "rgba(255,255,255,0.07)" }} />
              </div>
              <button
                type="button"
                className="sk-btn sk-btn-quiet"
                onClick={google}
                disabled={busy}
              >
                <svg aria-hidden="true" width="17" height="17" viewBox="0 0 24 24">
                  <path
                    fill="rgba(255,255,255,0.92)"
                    d="M12 10.2v3.9h5.5c-.24 1.4-1.7 4.1-5.5 4.1-3.3 0-6-2.7-6-6.1s2.7-6.1 6-6.1c1.9 0 3.1.8 3.9 1.5l2.6-2.5C16.9 3.4 14.7 2.4 12 2.4 6.7 2.4 2.4 6.7 2.4 12s4.3 9.6 9.6 9.6c5.5 0 9.2-3.9 9.2-9.4 0-.6-.1-1.1-.2-1.6H12z"
                  />
                </svg>
                Continue with Google
              </button>
              <p
                style={{
                  margin: "28px 0 0",
                  textAlign: "center",
                  fontSize: 13.5,
                  color: "rgba(255,255,255,0.62)",
                }}
              >
                {mode === "signup" ? "Already have an account?" : "New to Skido?"}{" "}
                <button
                  type="button"
                  className="sk-link-btn sk-a"
                  onClick={() => setMode(mode === "signup" ? "signin" : "signup")}
                  style={{ fontSize: 13.5, fontWeight: 500 }}
                >
                  {mode === "signup" ? "Sign in" : "Create an account"}
                </button>
              </p>
            </>
          ) : (
            mode !== "update_password" && (
              <p style={{ margin: "24px 0 0", textAlign: "center" }}>
                <button
                  type="button"
                  className="sk-link-btn"
                  onClick={() => {
                    setMode("signin");
                    setOtpCode("");
                  }}
                >
                  ← Back to sign in
                </button>
              </p>
            )
          )}
        </div>
      </div>
    </div>
  );
}
