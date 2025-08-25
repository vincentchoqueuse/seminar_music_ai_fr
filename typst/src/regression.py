import os
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401
import seaborn as sns
from matplotlib.colors import LightSource, Normalize
import pandas as pd
from matplotlib.colors import PowerNorm
import matplotlib as mpl



# ---------- Style / paramètres globaux ----------
sns.set_theme()
matplotlib.rcParams.update({
    "figure.dpi": 120,
    "savefig.dpi": 120,
    "svg.fonttype": "none",   # texte éditable dans les SVG
    "axes.grid": True,
})

colors = [
    "#264653",  # bleu foncé (primary)
    "#2A9D8F",  # turquoise / vert (secondary)
    "#E9C46A",  # jaune doux
    "#F4A261",  # orange
    "#E76F51",  # rouge-orangé
]


# ---------- Utilitaire pour sauver avec fond transparent sauf axes ----------
def savefig_with_axes_bg(fig, ax, filename, bgcolor="#EEEEEE"):
    """Sauvegarde une figure avec fond transparent sauf la zone des axes."""
    fig.patch.set_alpha(0)        # canvas global transparent
    ax.set_facecolor(bgcolor)       # zone des axes opaque
    # Couleur noire pour ticks, labels et titre
    ax.tick_params(colors="#666666")
    ax.xaxis.label.set_color("#666666")
    ax.yaxis.label.set_color("#666666")
    ax.title.set_color("#666666")
    for spine in ax.spines.values():
        spine.set_edgecolor("#666666")

    fig.savefig(filename, transparent=False, bbox_inches="tight")
    plt.close(fig)

# ----------------------------
# 0) Génération des données
# ----------------------------
rng = np.random.default_rng(42)
n = 40
X = np.linspace(0, 10, n)
X2 = np.linspace(0, 10, n) + rng.normal(0.0, 1, size=n)
true_a = 2.0
true_b = 1.0
sigma = 2.0
y = true_a * X + true_b + rng.normal(0.0, sigma, size=n)
y2 = true_a * X2 + true_b + rng.normal(0.0, sigma, size=n)
y3 = true_a * X + true_b
y4 = true_a * X2 + true_b

def fit_line_closed_form(x, y):
    x = np.asarray(x); y = np.asarray(y)
    xm = x.mean(); ym = y.mean()
    Sxx = np.sum((x - xm)**2)
    Sxy = np.sum((x - xm)*(y - ym))
    a_hat = Sxy / Sxx
    b_hat = ym - a_hat * xm
    return a_hat, b_hat

a_opt, b_opt = fit_line_closed_form(X, y)

def mse_for_params(a, b, x, y):
    pred = a * x + b
    return np.mean((y - pred)**2)

def grad_mse(a, b, x, y):
    pred = a * x + b
    resid = y - pred
    N = x.size
    dL_da = (-2.0 / N) * np.sum(x * resid)
    dL_db = (-2.0 / N) * np.sum(resid)
    return np.array([dL_da, dL_db])

# ----------------------------
# 1a) Données + droite vraie
# ----------------------------
fig, ax = plt.subplots(figsize=(8,3))
ax.plot(X, y, "o", linewidth=1, markersize=5, label="Données bruitées")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.legend()
ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data.svg")

fig, ax = plt.subplots(figsize=(8,3))
ax.plot(X, y, "o", linewidth=1, markersize=5, label="Données bruitées")
ax.plot(X2, y2, "ro", linewidth=1, markersize=5, label="Données generées")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.legend()
ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data_gen.svg")

fig, ax = plt.subplots(figsize=(8,3))
ax.plot(X, y, "o", linewidth=1, markersize=5, label="Données bruitées")
ax.plot(X, y3, "ro", linewidth=1, markersize=5, label="Données debruitées")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.legend()
ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data_denoise.svg")

fig, ax = plt.subplots(figsize=(8,3))
ax.plot(X, y, "o", linewidth=1, markersize=5, label="Données bruitées")
ax.plot(X2, y4, "ro", linewidth=1, markersize=5, label="Données predite")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.legend()
ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data_pred.svg")


# ----------------------------
# 1b) Famille de droites
# ----------------------------
pairs = np.array([(2, 4), (1, 2), (3, 0.5)])
palette = mpl.colors.ListedColormap(colors)

fig, ax = plt.subplots(figsize=(8,4.5))
for i, (a, b) in enumerate(pairs):
    ax.plot(X, a*X + b, alpha=0.7, linewidth=2,
            color=colors[i % len(colors)], label=f"a={a:.1f}, b={b:.1f}")


ax.set_xlabel("x"); ax.set_ylabel("y")
handles, labels = ax.get_legend_handles_labels()
sel = list(range(0, len(handles), max(1, len(handles)//8)))[:8]
ax.legend([handles[i] for i in sel], [labels[i] for i in sel],
          loc="best", fontsize=8, frameon=True)
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/lines_grid.svg")

# ----------------------------
# 2a) Données + mêmes droites
# ----------------------------
fig, ax = plt.subplots(figsize=(8,4.5))
for i, (a, b) in enumerate(pairs):
    ax.plot(X, a*X + b, alpha=0.7, linewidth=2,
            color=colors[i % len(colors)], label=f"a={a:.1f}, b={b:.1f}")

ax.set_xlabel("x"); ax.set_ylabel("y")
ax.legend(); ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/lines.svg")

fig, ax = plt.subplots(figsize=(8,4.5))
ax.plot(X, y, "o", label="Données bruitées", linewidth=1, markersize=5)
for i, (a, b) in enumerate(pairs):
    ax.plot(X, a*X + b, alpha=0.6, linewidth=2,
            color=colors[i % len(colors)], label=f"a={a:.1f}, b={b:.1f}")
ax.set_xlabel("x"); ax.set_ylabel("y")
ax.legend(); ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data_with_lines.svg")

# ----------------------------
# 2b) Surface 3D
# ----------------------------
A = np.linspace(true_a - 3.0, true_a + 3.0, 20)
B = np.linspace(true_b - 6.0, true_b + 6.0, 20)
AA, BB = np.meshgrid(A, B, indexing="xy")
pred = AA[..., None] * X[None, None, :] + BB[..., None]
resid = y[None, None, :] - pred
L = np.mean(resid**2, axis=-1)

cmap = plt.get_cmap("viridis")

fig = plt.figure(figsize=(8,6))
ax = fig.add_subplot(111, projection="3d")
ax.plot_surface(AA, BB, L, cmap=cmap, linewidth=0, alpha=0.85)

for i, (a, b) in enumerate(pairs):
    li = mse_for_params(a, b, X, y)
    ax.scatter(a, b, li, s=30, 
               edgecolor="black", linewidth=0.3)

L_opt = mse_for_params(a_opt, b_opt, X, y)
ax.scatter(a_opt, b_opt, L_opt, s=100, marker="*",
           edgecolor="black", linewidth=0.5,
           color="gold", depthshade=False)

ax.set_xlabel("a"); ax.set_ylabel("b")
ax.view_init(elev=28, azim=-62)
ax.set_box_aspect((1,1,0.7))
ax.grid(True)
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/cost_surface.svg")

# ----------------------------
# 3a) Données + droite optimale
# ----------------------------
fig, ax = plt.subplots(figsize=(8,4.5))
ax.plot(X, y, "o", label="Données bruitées", linewidth=1, markersize=5)
ax.plot(X, a_opt*X + b_opt, "r-", linewidth=3, label=f"Droite optimale")
ax.set_xlabel("x"); ax.set_ylabel("y")
ax.set_xlim([0, 10]); ax.set_ylim([0, 30])
ax.grid(True); ax.legend()
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/data_with_optimal_line.svg")

# ----------------------------
# 3b) Descente de gradient
# ----------------------------
theta0 = np.array([-1.0, -3.0])
eta = 0.01
steps = 1000
thetas = [theta0]
for _ in range(steps):
    g = grad_mse(thetas[-1][0], thetas[-1][1], X, y)
    thetas.append(thetas[-1] - eta * g)
thetas = np.array(thetas)
print(thetas[-1])

fig = plt.figure(figsize=(8,6))
ax = fig.add_subplot(111, projection="3d")
ax.plot_surface(AA, BB, L, cmap=cmap, linewidth=0, alpha=0.85)
path_L = [mse_for_params(a, b, X, y) for (a, b) in thetas]
ax.plot3D(thetas[:,0], thetas[:,1], path_L, "ro", alpha=1)
ax.set_xlabel("a"); ax.set_ylabel("b")
ax.view_init(elev=28, azim=-62)
ax.set_box_aspect((1,1,0.7))
ax.grid(True)
fig.tight_layout()
savefig_with_axes_bg(fig, ax, "./img/cost_surface_with_gd_path.svg")

# ----------------------------
# 4) Tableau des (a,b) et du coût
# ----------------------------
records = [{"a": float(a), "b": float(b),
            "L(a,b)": float(mse_for_params(a, b, X, y))}
           for (a, b) in pairs]
records.append({"a": float(a_opt), "b": float(b_opt), "L(a,b)": float(L_opt)})
df = pd.DataFrame(records).sort_values(by="L(a,b)").reset_index(drop=True)

print("\nTableau (a, b, L(a,b)) trié par coût croissant :")
with pd.option_context("display.float_format", "{:.4f}".format):
    print(df.to_string(index=False))

df.to_csv("./data/cost_table.csv", index=False)
print("\nTableau exporté vers ./data/cost_table.csv")
