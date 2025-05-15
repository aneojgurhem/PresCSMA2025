@task
def estimate_pi_partial(num_samples: int) -> tuple[int, int]:
    """Generates random points and counts those inside the unit circle."""
    points_in_circle = 0
    for _ in range(num_samples):
        x, y = random.random(), random.random()
        if x*x + y*y <= 1.0:
            points_in_circle += 1
    return (points_in_circle, num_samples)

@task
def sum_results(x):
    """Sums the samples to get an estimation of PI."""
    total_points_in_circle = sum(res[0] for res in x)
    total_samples = sum(res[1] for res in x)
    return 4.0 * total_points_in_circle / total_samples

if __name__ == "__main__":
    ntasks = 100 # Number of parallel tasks
    samples_per_task = 20000 # Samples per task

    with Pymonik(): 
        print(f"Submitting {ntasks} parallel tasks for Pi estimation")
        results = estimate_pi_partial.map_invoke([(samples_per_task,) for _ in range(ntasks)])
        final_result = sum_results.invoke(results)
        final_result = final_result.wait().get()
        print(f"Estimated value of Pi: {final_result}")
