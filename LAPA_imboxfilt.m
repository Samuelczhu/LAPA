% This file implement the code for ELEC 4700 PA 4
% The boundary conditions are: 1 on the left/right and 0 on top/bottom
% Solved using imboxfilt(V,3)

% Clear all
clearvars
clearvars -global
close all
format shorte

% Define the size of the solution matrix
nx = 20;
ny = 20;
% Assume delta x = delta y = delta
delta = 1;

% Create the solution matrix
V = zeros(nx, ny);

% Create the mesh grid
[X, Y] = meshgrid([1:nx], [1:ny]);

% Set the maximum number of simulation iterations
numSim = 300; 
% Pause time per simulation iteration
pauseTime = 0.01;


% Loop through the simulation iterations
for iSim = 1:numSim

    % Set boundary conditions: 1 on the left/right and 0 on top/bottom
    V(1,:) = 1;
    V(nx,:) = 1;
    V(:,1) = 0;
    V(:,ny) = 0;

    % Solve V using imboxfilt()
    V = imboxfilt(V, 3);

    % Plot the voltage surface
    surf(X,Y,V);

    % pause
    pause(pauseTime);
end

% Create the matrix for electric field
[Ex, Ey] = gradient(-V);

% Plot the electric field
figure(2)
quiver(X, Y, Ex, Ey);




